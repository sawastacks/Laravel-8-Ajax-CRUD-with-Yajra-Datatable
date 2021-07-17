-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2021 at 08:19 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel8ajaxcrud`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `capital_city`, `created_at`, `updated_at`) VALUES
(5, 'Denmark', 'Copenhagen', NULL, NULL),
(6, 'Germany', 'Berlin', NULL, NULL),
(7, 'Zambia', 'Lusaka', NULL, NULL),
(405, 'Rwanda', 'Kigali', NULL, NULL),
(406, 'India', 'New Delhi', NULL, NULL),
(416, 'United States', 'Washington, D.C', NULL, NULL),
(417, 'Afghanistan', 'Kabul', NULL, NULL),
(418, 'Albania', 'Tirana', NULL, NULL),
(419, 'Algeria', 'Algiers', NULL, NULL),
(420, 'Andorra', 'Andorra la Vella', NULL, NULL),
(421, 'Angola', 'Luanda', NULL, NULL),
(422, 'Antigua and Barbuda', 'St. John\'s', NULL, NULL),
(423, 'Argentina', 'Buenos Aires', NULL, NULL),
(424, 'Armenia', 'Yerevan', NULL, NULL),
(425, 'Australia', 'Canberra', NULL, NULL),
(426, 'Austria', 'Vienna', NULL, NULL),
(427, 'Azerbaijan', 'Baku', NULL, NULL),
(428, 'Bahamas', 'Nassau', NULL, NULL),
(429, 'Bahrain', 'Manama', NULL, NULL),
(430, 'Bangladesh', 'Dhaka', NULL, NULL),
(431, 'Barbados', 'Bridgetown', NULL, NULL),
(432, 'Belarus', 'Minsk', NULL, NULL),
(433, 'Belgium', 'Brussels', NULL, NULL),
(434, 'Belize', 'Belmopan', NULL, NULL),
(435, 'Benin', 'Porto Novo', NULL, NULL),
(436, 'Bhutan', 'Thimphu', NULL, NULL),
(437, 'Bolivia', 'Sucre', NULL, NULL),
(438, 'Bosnia and Herzegovina', 'Sarajevo', NULL, NULL),
(439, 'Botswana', 'Gaborone', NULL, NULL),
(440, 'Brazil', 'Brasilia', NULL, NULL),
(441, 'Brunei', 'Bandar Seri Begawan', NULL, NULL),
(442, 'Bulgaria', 'Sofia', NULL, NULL),
(443, 'Burkina Faso', 'Ouagadougou', NULL, NULL),
(444, 'Burundi', 'Bujumbura', NULL, NULL),
(445, 'Cambodia', 'Phnom Penh', NULL, NULL),
(446, 'Cameroon', 'Yaoundé', NULL, NULL),
(447, 'Canada', 'Ottawa', NULL, NULL),
(448, 'Cape Verde', 'Praia', NULL, NULL),
(449, 'Central African Republic', 'Bangui', NULL, NULL),
(450, 'Chad', 'N\'Djamena', NULL, NULL),
(451, 'Chile', 'Santiago', NULL, NULL),
(452, 'China', 'Beijing', NULL, NULL),
(453, 'Colombia', 'Bogota', NULL, NULL),
(454, 'Comoros', 'Moroni', NULL, NULL),
(455, 'Costa Rica', 'San José', NULL, NULL),
(456, 'Croatia', 'Zagreb', NULL, NULL),
(457, 'Cuba', 'Havana', NULL, NULL),
(458, 'Cyprus', 'Nicosia', NULL, NULL),
(459, 'Czech Republic', 'Prague', NULL, NULL),
(460, 'Democratic Republic of Congo', 'Kinshasa', NULL, NULL),
(461, 'Djibouti', 'Djibouti', NULL, NULL),
(462, 'Dominica', 'Roseau', NULL, NULL),
(463, 'Dominican Republic', 'Santo Domingo', NULL, NULL),
(464, 'East Timor', 'Dili', NULL, NULL),
(465, 'Ecuador', 'Quito', NULL, NULL),
(466, 'Egypt', 'Cairo', NULL, NULL),
(467, 'El Salvador', 'San Salvador', NULL, NULL),
(468, 'Equatorial Guinea', 'Malabo', NULL, NULL),
(469, 'Eritrea', 'Asmara', NULL, NULL),
(470, 'Estonia', 'Tallinn', NULL, NULL),
(471, 'Eswatini', 'Mbabane', NULL, NULL),
(472, 'Ethiopia', 'Addis Ababa', NULL, NULL),
(473, 'Fiji', 'Suva', NULL, NULL),
(474, 'Finland', 'Helsinki', NULL, NULL),
(475, 'France', 'Paris', NULL, NULL),
(476, 'Gabon', 'Libreville', NULL, NULL),
(477, 'Gambia', 'Banjul', NULL, NULL),
(478, 'Georgia', 'Tbilisi', NULL, NULL),
(479, 'Ghana', 'Accra', NULL, NULL),
(480, 'Greece', 'Athens', NULL, NULL),
(481, 'Grenada', 'St. George\'s', NULL, NULL),
(482, 'Guatemala', 'Guatemala City', NULL, NULL),
(483, 'Guinea', 'Conakry', NULL, NULL),
(484, 'Guinea-Bissau', 'Bissau', NULL, NULL),
(485, 'Guyana', 'Georgetown', NULL, NULL),
(486, 'Haiti', 'Port-au-Prince', NULL, NULL),
(487, 'Honduras', 'Tegucigalpa', NULL, NULL),
(488, 'Hungary', 'Budapest', NULL, NULL),
(489, 'Iceland', 'Reykjavík', NULL, NULL),
(490, 'Indonesia', 'Jakarta', NULL, NULL),
(491, 'Iran', 'Tehran', NULL, NULL),
(492, 'Iraq', 'Baghdad', NULL, NULL),
(493, 'Ireland', 'Dublin', NULL, NULL),
(494, 'Israel', 'Jerusalem', NULL, NULL),
(495, 'Italy', 'Rome', NULL, NULL),
(496, 'Ivory Coast', 'Yamoussoukro', NULL, NULL),
(497, 'Jamaica', 'Kingston', NULL, NULL),
(498, 'Japan', 'Tokyo', NULL, NULL),
(499, 'Jordan', 'Amman', NULL, NULL),
(500, 'Kazakhstan', 'Astana', NULL, NULL),
(501, 'Kenya', 'Nairobi', NULL, NULL),
(502, 'Kiribati', 'Tarawa', NULL, NULL),
(503, 'Korea, North', 'Pyongyang', NULL, NULL),
(504, 'Korea, South', 'Seoul', NULL, NULL),
(505, 'Kosovo', 'Pristina', NULL, NULL),
(506, 'Kuwait', 'Kuwait City', NULL, NULL),
(507, 'Kyrgyzstan', 'Bishkek', NULL, NULL),
(508, 'Laos', 'Vientiane', NULL, NULL),
(509, 'Latvia', 'Riga', NULL, NULL),
(510, 'Lebanon', 'Beirut', NULL, NULL),
(511, 'Lesotho', 'Maseru', NULL, NULL),
(512, 'Liberia', 'Monrovia', NULL, NULL),
(513, 'Libya', 'Tripoli', NULL, NULL),
(514, 'Liechtenstein', 'Vaduz', NULL, NULL),
(515, 'Lithuania', 'Vilnius', NULL, NULL),
(516, 'Luxembourg', 'Luxembourg', NULL, NULL),
(517, 'Madagascar', 'Antananarivo', NULL, NULL),
(518, 'Malawi', 'Lilongwe', NULL, NULL),
(519, 'Malaysia', 'Kuala Lumpur', NULL, NULL),
(520, 'Maldives', 'Malé', NULL, NULL),
(521, 'Mali', 'Bamako', NULL, NULL),
(522, 'Malta', 'Valletta', NULL, NULL),
(523, 'Marshall Islands', 'Majuro', NULL, NULL),
(524, 'Mauritania', 'Nouakchott', NULL, NULL),
(525, 'Mauritius', 'Port Louis', NULL, NULL),
(526, 'Mexico', 'Mexico City', NULL, NULL),
(527, 'Micronesia', 'Palikir', NULL, NULL),
(528, 'Moldova', 'Chisinau', NULL, NULL),
(529, 'Monaco', 'Monaco', NULL, NULL),
(530, 'Mongolia', 'Ulaanbaatar', NULL, NULL),
(531, 'Montenegro', 'Podgorica', NULL, NULL),
(532, 'Morocco', 'Rabat', NULL, NULL),
(533, 'Mozambique', 'Maputo', NULL, NULL),
(534, 'Myanmar', 'Naypyidaw', NULL, NULL),
(535, 'Namibia', 'Windhoek', NULL, NULL),
(536, 'Nauru', 'Yaren', NULL, NULL),
(537, 'Nepal', 'Kathmandu', NULL, NULL),
(538, 'Netherlands', 'Amsterdam', NULL, NULL),
(539, 'New Zealand', 'Wellington', NULL, NULL),
(540, 'Nicaragua', 'Managua', NULL, NULL),
(541, 'Niger', 'Niamey', NULL, NULL),
(542, 'Nigeria', 'Abuja', NULL, NULL),
(543, 'North Macedonia', 'Skopje', NULL, NULL),
(544, 'Norway', 'Oslo', NULL, NULL),
(545, 'Oman', 'Muscat', NULL, NULL),
(546, 'Pakistan', 'Islamabad', NULL, NULL),
(547, 'Palau', 'Melekeok', NULL, NULL),
(548, 'Palestine', 'East Jerusalem', NULL, NULL),
(549, 'Panama', 'Panama City', NULL, NULL),
(550, 'Papua New Guinea', 'Port Moresby', NULL, NULL),
(551, 'Paraguay', 'Asunción', NULL, NULL),
(552, 'Peru', 'Lima', NULL, NULL),
(553, 'Philippines', 'Manila', NULL, NULL),
(554, 'Poland', 'Warsaw', NULL, NULL),
(555, 'Portugal', 'Lisbon', NULL, NULL),
(556, 'Qatar', 'Doha', NULL, NULL),
(557, 'Republic of the Congo', 'Brazzaville', NULL, NULL),
(558, 'Romania', 'Bucharest', NULL, NULL),
(559, 'Russia', 'Moscow', NULL, NULL),
(560, 'Saint Kitts and Nevis', 'Basseterre', NULL, NULL),
(561, 'Saint Lucia', 'Castries', NULL, NULL),
(562, 'Saint Vincent and the Grenadines', 'Kingstown', NULL, NULL),
(563, 'Samoa', 'Apia', NULL, NULL),
(564, 'San Marino', 'San Marino', NULL, NULL),
(565, 'São Tomé and Príncipe', 'São Tomé', NULL, NULL),
(566, 'Saudi Arabia', 'Riyadh', NULL, NULL),
(567, 'Senegal', 'Dakar', NULL, NULL),
(568, 'Serbia', 'Belgrade', NULL, NULL),
(569, 'Seychelles', 'Victoria', NULL, NULL),
(570, 'Sierra Leone', 'Freetown', NULL, NULL),
(571, 'Singapore', 'Singapore', NULL, NULL),
(572, 'Slovakia', 'Bratislava', NULL, NULL),
(573, 'Slovenia', 'Ljubljana', NULL, NULL),
(574, 'Solomon Islands', 'Honiara', NULL, NULL),
(575, 'Somalia', 'Mogadishu', NULL, NULL),
(576, 'South Africa', 'Pretoria', NULL, NULL),
(577, 'South Sudan', 'Juba', NULL, NULL),
(578, 'Spain', 'Madrid', NULL, NULL),
(579, 'Sri Lanka', 'Sri Jayawardenapura Kotte', NULL, NULL),
(580, 'Sudan', 'Khartoum', NULL, NULL),
(581, 'Suriname', 'Paramaribo', NULL, NULL),
(582, 'Sweden', 'Stockholm', NULL, NULL),
(583, 'Switzerland', 'Bern', NULL, NULL),
(584, 'Syria', 'Damascus', NULL, NULL),
(585, 'Taiwan', 'Taipei', NULL, NULL),
(586, 'Tajikistan', 'Dushanbe', NULL, NULL),
(587, 'Tanzania', 'Dodoma', NULL, NULL),
(588, 'Thailand', 'Bangkok', NULL, NULL),
(589, 'Togo', 'Lomé', NULL, NULL),
(590, 'Tonga', 'Nukualofa', NULL, NULL),
(591, 'Trinidad and Tobago', 'Port of Spain', NULL, NULL),
(592, 'Tunisia', 'Tunis', NULL, NULL),
(593, 'Turkey', 'Ankara', NULL, NULL),
(594, 'Turkmenistan', 'Ashgabat', NULL, NULL),
(595, 'Tuvalu', 'Funafuti', NULL, NULL),
(596, 'Uganda', 'Kampala', NULL, NULL),
(597, 'Ukraine', 'Kiev', NULL, NULL),
(598, 'United Arab Emirates', 'Abu Dhabi', NULL, NULL),
(599, 'United Kingdom', 'London', NULL, NULL),
(600, 'Uruguay', 'Montevideo', NULL, NULL),
(601, 'Uzbekistan', 'Tashkent', NULL, NULL),
(602, 'Vanuatu', 'Port Vila', NULL, NULL),
(603, 'Vatican City', 'Vatican City', NULL, NULL),
(604, 'Venezuela', 'Caracas', NULL, NULL),
(605, 'Vietnam', 'Hanoi', NULL, NULL),
(606, 'Yemen', 'Sana\'a', NULL, NULL),
(607, 'Zimbabwe', 'Harare', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=608;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
