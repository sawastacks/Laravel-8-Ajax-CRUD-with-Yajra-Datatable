
# Laravel 8 Ajax CRUD with Yajra Datatable

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling.

Imagine about the situation when you see thousands of records, and you have to scan through every record to get the required information. Seems difficult isn’t? Well, I found Datatables makes our work less miserable and offers quick search, pagination, ordering, sorting functionalities to manage the data dynamically in the table.

DataTables is a plug-in powered by jQuery often known as Javascript library. It is a notably flexible tool, developed upon the foundations of progressive and dynamic enhancement, that incorporates all of these subtle and advanced features to any static HTML table.

You will need the following dependencies in order to achieve this topic:

- [Jquery](https://jquery.com/).
- [Bootstrap](https://getbootstrap.com/).
- [SweetAlert2](https://sweetalert2.github.io/).
- [Toastr js](https://github.com/CodeSeven/toastr).
- [Yajra Datatable](https://github.com/yajra/laravel-datatables).

After having the above elements and included on your layout, you are now able to follow the following steps.

### *Install Yajra Datatable Package*
I wonder if you haven’t heard about [Yajra Datatables library](https://github.com/yajra/laravel-datatables), it is a jQuery DataTables API for Laravel 4|5|6|7. This plugin handles server-side works of DataTables jQuery plugin through AJAX option by considering the Eloquent ORM, Fluent Query Builder or Collection.

Theoretically, the following command helps you installing the Yajra DataTable plugin in Laravel.
```bash
   composer require yajra/laravel-datatables-oracle
```
Additionally, enlarge the foundational service of the package such as datatable service provider in providers and alias inside the config/app.php file.
```php
.....
.....
'providers' => [
	....
	....
	Yajra\DataTables\DataTablesServiceProvider::class,
]
'aliases' => [
	....
	....
	'DataTables' => Yajra\DataTables\Facades\DataTables::class,
]
.....
.....
```
Run vendor publish command further this step is optional:
```bash
php artisan vendor:publish --provider="Yajra\DataTables\DataTablesServiceProvider"
```
## Routes

```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CountriesController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/countries-list',[CountriesController::class, 'index'])->name('countries.list');
Route::post('/add-country',[CountriesController::class,'addCountry'])->name('add.country');
Route::get('/getCountriesList',[CountriesController::class, 'getCountriesList'])->name('get.countries.list');
Route::post('/getCountryDetails',[CountriesController::class, 'getCountryDetails'])->name('get.country.details');
Route::post('/updateCountryDetails',[CountriesController::class, 'updateCountryDetails'])->name('update.country.details');
Route::post('/deleteCountry',[CountriesController::class,'deleteCountry'])->name('delete.country');
Route::post('/deleteSelectedCountries',[CountriesController::class,'deleteSelectedCountries'])->name('delete.selected.countries');
```

## Countries Controller
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Country;
use DataTables;

class CountriesController extends Controller
{
    //COUNTRIES LIST
    public function index(){
        return view('countries-list');
    }

    //ADD NEW COUNTRY
    public function addCountry(Request $request){
         $validator = \Validator::make($request->all(),[
             'country_name'=>'required|unique:countries',
             'capital_city'=>'required',
         ]);

         if(!$validator->passes()){
              return response()->json(['code'=>0,'error'=>$validator->errors()->toArray()]);
         }else{
             $country = new Country();
             $country->country_name = $request->country_name;
             $country->capital_city = $request->capital_city;
             $query = $country->save();

             if(!$query){
                 return response()->json(['code'=>0,'msg'=>'Something went wrong']);
             }else{
                 return response()->json(['code'=>1,'msg'=>'New Country has been successfully saved']);
             }
         }
    }

    // GET ALL COUNTRIES
    public function getCountriesList(Request $request){
          $countries = Country::all();
          return DataTables::of($countries)
                              ->addIndexColumn()
                              ->addColumn('actions', function($row){
                                  return '<div class="btn-group">
                                                <button class="btn btn-sm btn-primary" data-id="'.$row['id'].'" id="editCountryBtn">Update</button>
                                                <button class="btn btn-sm btn-danger" data-id="'.$row['id'].'" id="deleteCountryBtn">Delete</button>
                                          </div>';
                              })
                              ->addColumn('checkbox', function($row){
                                  return '<input type="checkbox" name="country_checkbox" data-id="'.$row['id'].'"><label></label>';
                              })
                         
                              ->rawColumns(['actions','checkbox'])
                              ->make(true);
    }

    //GET COUNTRY DETAILS
    public function getCountryDetails(Request $request){
        $country_id = $request->country_id;
        $countryDetails = Country::find($country_id);
        return response()->json(['details'=>$countryDetails]);
    }

    //UPDATE COUNTRY DETAILS
    public function updateCountryDetails(Request $request){
        $country_id = $request->cid;

        $validator = \Validator::make($request->all(),[
            'country_name'=>'required|unique:countries,country_name,'.$country_id,
            'capital_city'=>'required'
        ]);

        if(!$validator->passes()){
               return response()->json(['code'=>0,'error'=>$validator->errors()->toArray()]);
        }else{
             
            $country = Country::find($country_id);
            $country->country_name = $request->country_name;
            $country->capital_city = $request->capital_city;
            $query = $country->save();

            if($query){
                return response()->json(['code'=>1, 'msg'=>'Country Details have Been updated']);
            }else{
                return response()->json(['code'=>0, 'msg'=>'Something went wrong']);
            }
        }
    }

    // DELETE COUNTRY RECORD
    public function deleteCountry(Request $request){
        $country_id = $request->country_id;
        $query = Country::find($country_id)->delete();

        if($query){
            return response()->json(['code'=>1, 'msg'=>'Country has been deleted from database']);
        }else{
            return response()->json(['code'=>0, 'msg'=>'Something went wrong']);
        }
    }


    public function deleteSelectedCountries(Request $request){
       $country_ids = $request->countries_ids;
       Country::whereIn('id', $country_ids)->delete();
       return response()->json(['code'=>1, 'msg'=>'Countries have been deleted from database']); 
    }


}

```
## Edit countries modal
```html
<div class="modal fade editCountry" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit Country</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                 <form action="<?= route('update.country.details') ?>" method="post" id="update-country-form">
                    @csrf
                     <input type="hidden" name="cid">
                     <div class="form-group">
                         <label for="">Country name</label>
                         <input type="text" class="form-control" name="country_name" placeholder="Enter country name">
                         <span class="text-danger error-text country_name_error"></span>
                     </div>
                     <div class="form-group">
                         <label for="">Capital city</label>
                         <input type="text" class="form-control" name="capital_city" placeholder="Enter capital city">
                         <span class="text-danger error-text capital_city_error"></span>
                     </div>
                     <div class="form-group">
                         <button type="submit" class="btn btn-block btn-success">Save Changes</button>
                     </div>
                 </form>
                

            </div>
        </div>
    </div>
</div>
```

## Countries list blade layout
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Countries List</title>
    <link rel="stylesheet" href="{{ asset('bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('datatable/css/dataTables.bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('datatable/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('sweetalert2/sweetalert2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('toastr/toastr.min.css') }}">
</head>
<body>
    <div class="container">
          <div class="row" style="margin-top: 45px">
              <div class="col-md-8">

                <input type="text" name="searchfor" id="" class="form-control">
                    <div class="card">
                        <div class="card-header">Countries</div>
                        <div class="card-body">
                            <table class="table table-hover table-condensed" id="counties-table">
                                <thead>
                                    <th><input type="checkbox" name="main_checkbox"><label></label></th>
                                    <th>#</th>
                                    <th>Country name</th>
                                    <th>Capital City</th>
                                    <th>Actions <button class="btn btn-sm btn-danger d-none" id="deleteAllBtn">Delete All</button></th>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
              </div>
              <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Add new Country</div>
                        <div class="card-body">
                            <form action="{{ route('add.country') }}" method="post" id="add-country-form" autocomplete="off">
                                @csrf
                                <div class="form-group">
                                    <label for="">Country name</label>
                                    <input type="text" class="form-control" name="country_name" placeholder="Enter country name">
                                    <span class="text-danger error-text country_name_error"></span>
                                </div>
                                <div class="form-group">
                                    <label for="">Capital city</label>
                                    <input type="text" class="form-control" name="capital_city" placeholder="Enter capital city">
                                    <span class="text-danger error-text capital_city_error"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-block btn-success">SAVE</button>
                                </div>
                            </form>
                        </div>
                    </div>
              </div>
          </div>

    </div>

     @include('edit-country-modal')
    <script src="{{ asset('jquery/jquery-3.6.0.min.js') }}"></script>
    <script src="{{ asset('bootstrap/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('datatable/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('datatable/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('toastr/toastr.min.js') }}"></script>
    <script>

         toastr.options.preventDuplicates = true;

         $.ajaxSetup({
             headers:{
                 'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
             }
         });


         $(function(){

                //ADD NEW COUNTRY
                $('#add-country-form').on('submit', function(e){
                    e.preventDefault();
                    var form = this;
                    $.ajax({
                        url:$(form).attr('action'),
                        method:$(form).attr('method'),
                        data:new FormData(form),
                        processData:false,
                        dataType:'json',
                        contentType:false,
                        beforeSend:function(){
                             $(form).find('span.error-text').text('');
                        },
                        success:function(data){
                             if(data.code == 0){
                                   $.each(data.error, function(prefix, val){
                                       $(form).find('span.'+prefix+'_error').text(val[0]);
                                   });
                             }else{
                                 $(form)[0].reset();
                                //  alert(data.msg);
                                $('#counties-table').DataTable().ajax.reload(null, false);
                                toastr.success(data.msg);
                             }
                        }
                    });
                });

                //GET ALL COUNTRIES
               var table =  $('#counties-table').DataTable({
                     processing:true,
                     info:true,
                     ajax:"{{ route('get.countries.list') }}",
                     "pageLength":5,
                     "aLengthMenu":[[5,10,25,50,-1],[5,10,25,50,"All"]],
                     columns:[
                        //  {data:'id', name:'id'},
                         {data:'checkbox', name:'checkbox', orderable:false, searchable:false},
                         {data:'DT_RowIndex', name:'DT_RowIndex'},
                         {data:'country_name', name:'country_name'},
                         {data:'capital_city', name:'capital_city'},
                         {data:'actions', name:'actions', orderable:false, searchable:false},
                     ]
                }).on('draw', function(){
                    $('input[name="country_checkbox"]').each(function(){this.checked = false;});
                    $('input[name="main_checkbox"]').prop('checked', false);
                    $('button#deleteAllBtn').addClass('d-none');
                });

                $(document).on('click','#editCountryBtn', function(){
                    var country_id = $(this).data('id');
                    $('.editCountry').find('form')[0].reset();
                    $('.editCountry').find('span.error-text').text('');
                    $.post('<?= route("get.country.details") ?>',{country_id:country_id}, function(data){
                        //  alert(data.details.country_name);
                        $('.editCountry').find('input[name="cid"]').val(data.details.id);
                        $('.editCountry').find('input[name="country_name"]').val(data.details.country_name);
                        $('.editCountry').find('input[name="capital_city"]').val(data.details.capital_city);
                        $('.editCountry').modal('show');
                    },'json');
                });


                //UPDATE COUNTRY DETAILS
                $('#update-country-form').on('submit', function(e){
                    e.preventDefault();
                    var form = this;
                    $.ajax({
                        url:$(form).attr('action'),
                        method:$(form).attr('method'),
                        data:new FormData(form),
                        processData:false,
                        dataType:'json',
                        contentType:false,
                        beforeSend: function(){
                             $(form).find('span.error-text').text('');
                        },
                        success: function(data){
                              if(data.code == 0){
                                  $.each(data.error, function(prefix, val){
                                      $(form).find('span.'+prefix+'_error').text(val[0]);
                                  });
                              }else{
                                  $('#counties-table').DataTable().ajax.reload(null, false);
                                  $('.editCountry').modal('hide');
                                  $('.editCountry').find('form')[0].reset();
                                  toastr.success(data.msg);
                              }
                        }
                    });
                });

                //DELETE COUNTRY RECORD
                $(document).on('click','#deleteCountryBtn', function(){
                    var country_id = $(this).data('id');
                    var url = '<?= route("delete.country") ?>';

                    swal.fire({
                         title:'Are you sure?',
                         html:'You want to <b>delete</b> this country',
                         showCancelButton:true,
                         showCloseButton:true,
                         cancelButtonText:'Cancel',
                         confirmButtonText:'Yes, Delete',
                         cancelButtonColor:'#d33',
                         confirmButtonColor:'#556ee6',
                         width:300,
                         allowOutsideClick:false
                    }).then(function(result){
                          if(result.value){
                              $.post(url,{country_id:country_id}, function(data){
                                   if(data.code == 1){
                                       $('#counties-table').DataTable().ajax.reload(null, false);
                                       toastr.success(data.msg);
                                   }else{
                                       toastr.error(data.msg);
                                   }
                              },'json');
                          }
                    });

                });




           $(document).on('click','input[name="main_checkbox"]', function(){
                  if(this.checked){
                    $('input[name="country_checkbox"]').each(function(){
                        this.checked = true;
                    });
                  }else{
                     $('input[name="country_checkbox"]').each(function(){
                         this.checked = false;
                     });
                  }
                  toggledeleteAllBtn();
           });

           $(document).on('change','input[name="country_checkbox"]', function(){

               if( $('input[name="country_checkbox"]').length == $('input[name="country_checkbox"]:checked').length ){
                   $('input[name="main_checkbox"]').prop('checked', true);
               }else{
                   $('input[name="main_checkbox"]').prop('checked', false);
               }
               toggledeleteAllBtn();
           });


           function toggledeleteAllBtn(){
               if( $('input[name="country_checkbox"]:checked').length > 0 ){
                   $('button#deleteAllBtn').text('Delete ('+$('input[name="country_checkbox"]:checked').length+')').removeClass('d-none');
               }else{
                   $('button#deleteAllBtn').addClass('d-none');
               }
           }


           $(document).on('click','button#deleteAllBtn', function(){
               var checkedCountries = [];
               $('input[name="country_checkbox"]:checked').each(function(){
                   checkedCountries.push($(this).data('id'));
               });

               var url = '{{ route("delete.selected.countries") }}';
               if(checkedCountries.length > 0){
                   swal.fire({
                       title:'Are you sure?',
                       html:'You want to delete <b>('+checkedCountries.length+')</b> countries',
                       showCancelButton:true,
                       showCloseButton:true,
                       confirmButtonText:'Yes, Delete',
                       cancelButtonText:'Cancel',
                       confirmButtonColor:'#556ee6',
                       cancelButtonColor:'#d33',
                       width:300,
                       allowOutsideClick:false
                   }).then(function(result){
                       if(result.value){
                           $.post(url,{countries_ids:checkedCountries},function(data){
                              if(data.code == 1){
                                  $('#counties-table').DataTable().ajax.reload(null, true);
                                  toastr.success(data.msg);
                              }
                           },'json');
                       }
                   })
               }
           });
        



         });

    </script>
</body>
</html>
```
