/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `like_stat` tinyint DEFAULT NULL,
  `date_like` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_order` timestamp NULL DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Plegadis falcinellus', 'http://dummyimage.com/201x100.png/5fa2dd/ffffff', 4, 'Gamhnwvcanphzwgfjuynpzfjmwziqaaqzjwpreirnpxlkhn', 9);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Panthera leo persica', 'http://dummyimage.com/230x100.png/dddddd/000000', 90, 'Jplekderdgfoglhicmtowdrdhqqbhodbelwvgdfwkfbggry', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Meles meles', 'http://dummyimage.com/211x100.png/cc0000/ffffff', 88, 'Ieffxecwwpxhcaexaaasdvvknwhgkkdjygjcreqvanhyqke', 5);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Bison bison', 'http://dummyimage.com/208x100.png/cc0000/ffffff', 92, 'Ziegykvqampdkiitlixhkbtcqzaqxrpunaxbvrtanrdusgz', 7),
(5, 'Sceloporus magister', 'http://dummyimage.com/157x100.png/5fa2dd/ffffff', 86, 'Disowabhnsznyucnjjdjutnhvoqihjodvueflztdxohbadu', 3),
(6, 'Cynictis penicillata', 'http://dummyimage.com/227x100.png/cc0000/ffffff', 65, 'Ufwbelwpwnntztjykfpkbifyzvfkscqpkebxdciniohhcrj', 7),
(7, 'Macropus fuliginosus', 'http://dummyimage.com/239x100.png/5fa2dd/ffffff', 20, 'Rofggmbyuglbhwmberyxphkewvfwudnfpgnyenctsebmyzf', 10),
(8, 'Callorhinus ursinus', 'http://dummyimage.com/204x100.png/ff4444/ffffff', 31, 'Krjwaftfbeswtaqjsjbkzedvhoedhaghlbzezrjykbxlthd', 5),
(9, 'Haliaeetus leucocephalus', 'http://dummyimage.com/194x100.png/dddddd/000000', 93, 'Bruyhakstywchjagxjxwniylhuzbbvrebmvizpgdchqbpam', 9),
(10, 'Sciurus vulgaris', 'http://dummyimage.com/171x100.png/ff4444/ffffff', 88, 'Zaakqiwmwyyskwmhhrhwhtlqknnedcqrhlxbxcqktjabkor', 9),
(11, 'Spilogale gracilis', 'http://dummyimage.com/103x100.png/ff4444/ffffff', 96, 'Tyrhmsvvrjjhuyheniybzpbcwpyuaafegfclndhxkicnshz', 9),
(12, 'Eudyptula minor', 'http://dummyimage.com/233x100.png/ff4444/ffffff', 24, 'Bidkooyrjaocpnjpvixoqkcmqzssgrkqnqvyyzvtlewaawz', 1),
(13, 'Geochelone radiata', 'http://dummyimage.com/189x100.png/5fa2dd/ffffff', 44, 'Helrlieqsnomblokjdanlfmdpfatdigzzbathqptpwzxnxj', 1),
(14, 'Bucephala clangula', 'http://dummyimage.com/147x100.png/dddddd/000000', 50, 'Dzahxfgbbomcnypepvintzghqxcswhuxpppanaaxcyngknj', 8),
(15, 'Macropus eugenii', 'http://dummyimage.com/216x100.png/5fa2dd/ffffff', 89, 'Gvoifzvywacpajwvrsiyfgpnhuuqtsoogstgwbwyqtwowto', 5),
(16, 'Sula dactylatra', 'http://dummyimage.com/237x100.png/5fa2dd/ffffff', 51, 'Rbgvtxsbzyohnmsceykfoxrtepbvotrqkilwvxgylvqcyuo', 9),
(17, 'Crotalus triseriatus', 'http://dummyimage.com/122x100.png/dddddd/000000', 10, 'Jfmooietlgwtquywupdqvkzftrfcexwzyigdsujemnfshju', 3),
(18, 'Aonyx capensis', 'http://dummyimage.com/227x100.png/cc0000/ffffff', 66, 'Bvgupxfzqgdobswqtxdiodgbzizlrplliuufjwlcikofuoz', 6),
(19, 'Myrmecophaga tridactyla', 'http://dummyimage.com/112x100.png/cc0000/ffffff', 14, 'Zjsgxzdhjtbngwdlhvslhhjlpgcpwgvvblziaizccgmsnvf', 6),
(20, 'Varanus salvator', 'http://dummyimage.com/111x100.png/cc0000/ffffff', 43, 'Wgwxtxmmmqrmbzlukuownqpckifigsyjfjijugcmxxdsgcm', 9),
(21, 'Cathartes aura', 'http://dummyimage.com/116x100.png/dddddd/000000', 56, 'Ayhuzhwypddrtohkwtqjvzgghprerfyawywvgmksebxjdfy', 9),
(22, 'Fregata magnificans', 'http://dummyimage.com/160x100.png/cc0000/ffffff', 51, 'Xhrarncqlutvpfjweahhbdrlrrjxcrinbvvjgmjtbmcgbtu', 8),
(23, 'Cacatua galerita', 'http://dummyimage.com/232x100.png/dddddd/000000', 88, 'Ggxtwgaaiiyswfhklbxxrrntlpcthltzkbalibhzsskaxsj', 9),
(24, 'Odocoileus hemionus', 'http://dummyimage.com/224x100.png/cc0000/ffffff', 49, 'Oeeqvpocbfahilnwwgbnlczczbylyelqzzfxkczbuktgwti', 8),
(25, 'Larus novaehollandiae', 'http://dummyimage.com/247x100.png/dddddd/000000', 87, 'Lodevmpcuzygakedojgowhdfteexucdtzznpisszamnxyjn', 9),
(26, 'Castor fiber', 'http://dummyimage.com/209x100.png/cc0000/ffffff', 36, 'Oebfpbxkcybogcbmxvyyqgzehqzafeumnwfetftkhlghogu', 10),
(27, 'Parus atricapillus', 'http://dummyimage.com/190x100.png/dddddd/000000', 14, 'Rmlgdlqzicrgwuenhjxuperofnovbcmwqnqsilirmkmolrh', 8),
(28, 'Geochelone elephantopus', 'http://dummyimage.com/142x100.png/cc0000/ffffff', 56, 'Axddurqjhjgpkoezlcwztxjamwhucghbvpgymjcwtywuiwd', 3),
(29, 'Manouria emys', 'http://dummyimage.com/177x100.png/dddddd/000000', 80, 'Evyfxsiwlkpearkmudoxloucrhegzjlejrzmfewuayifrvd', 6),
(30, 'Neophron percnopterus', 'http://dummyimage.com/162x100.png/5fa2dd/ffffff', 35, 'Rxegqonyqkoxvpktlycrervbbopsqyfhhlzuvuwvwwqxxbh', 10),
(31, 'Sula dactylatra', 'http://dummyimage.com/240x100.png/5fa2dd/ffffff', 44, 'Akxmuirlsfjcdlnybaqwcxxhssfyqhnqsiwwjyazrhwewbh', 5),
(32, 'Redunca redunca', 'http://dummyimage.com/203x100.png/dddddd/000000', 68, 'Fcxhuitqwyjsobglfhribfrrvwwcnugzeyuasfhzfntaezi', 10),
(33, 'Phoca vitulina', 'http://dummyimage.com/105x100.png/dddddd/000000', 27, 'Fcdymzasbrzliwlvbcqvvyacpfgiylzufjogmqxiizhgavk', 1),
(34, 'Ctenophorus ornatus', 'http://dummyimage.com/205x100.png/5fa2dd/ffffff', 38, 'Kbbfawdabcoyvrvhwrdbtekwcolsfvxdgpbfsyoebrmtycr', 7),
(35, 'Acrobates pygmaeus', 'http://dummyimage.com/160x100.png/cc0000/ffffff', 43, 'Tlwpnqirslgcwpglkxxfutmiliqxorzpyqqbnygfkvfbyoq', 4),
(36, 'Raphicerus campestris', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 18, 'Icllfziuvrwfnyfstnfhozpirmodudydovtkfmxvwkwgplr', 9),
(37, 'Alopex lagopus', 'http://dummyimage.com/130x100.png/5fa2dd/ffffff', 44, 'Dfjmdmtfonwbkmzpazaipfvoerlzpujhcmwwpbvzsklmwep', 8),
(38, 'Alces alces', 'http://dummyimage.com/136x100.png/5fa2dd/ffffff', 87, 'Lzzkfwbchieybzptcayrnkpulaeeockrorwlyjbtwnrzafp', 2),
(39, 'Milvus migrans', 'http://dummyimage.com/165x100.png/5fa2dd/ffffff', 65, 'Jaassqtzmuaekpnhvjmoaoulpiygsjpwuvnlhemkabvhkfy', 5),
(40, 'Cygnus atratus', 'http://dummyimage.com/205x100.png/dddddd/000000', 49, 'Ltlpmccpdalnuorlzsksizjuhvngpmnuqrbnocggkwoawfj', 2),
(41, 'Neotoma sp.', 'http://dummyimage.com/130x100.png/ff4444/ffffff', 17, 'Mzxjinjrivdjoizovmarqghzdnmezduhjhkuplbodezywhx', 8),
(42, 'Pelecans onocratalus', 'http://dummyimage.com/127x100.png/dddddd/000000', 49, 'Cibssbmnpevpawskjmudsspsjhgmjqovmgewbnyupgzjvos', 5),
(43, 'Eudromia elegans', 'http://dummyimage.com/120x100.png/cc0000/ffffff', 49, 'Kdxxxtsekhsqzuigqqlqsgkrfzhevjrskeiyyghcsvfopdd', 6),
(44, 'Libellula quadrimaculata', 'http://dummyimage.com/113x100.png/cc0000/ffffff', 36, 'Gktbohfiprqdyruqmrekaszrrgbvlfyoeqfnbbdevghcyel', 2),
(45, 'Sterna paradisaea', 'http://dummyimage.com/213x100.png/cc0000/ffffff', 89, 'Ouipcylstagilchaaejcixwdoiaigiimhbdjoapcvekyzpd', 1),
(46, 'Uraeginthus granatina', 'http://dummyimage.com/165x100.png/cc0000/ffffff', 72, 'Ovygcchvcgubnsatjhodyyksfvpzntmtzamqlhaeyxqqomf', 1),
(47, 'Cracticus nigroagularis', 'http://dummyimage.com/116x100.png/5fa2dd/ffffff', 1, 'Rfjjiucknyuqtgqiglzimrvsmvifugdszxlbouotrebjtps', 2),
(48, 'Fregata magnificans', 'http://dummyimage.com/186x100.png/ff4444/ffffff', 13, 'Iwkleueadnwxuqkcuyvzadeuvezamrykhivoixutowlzuhs', 8),
(49, 'Carphophis sp.', 'http://dummyimage.com/245x100.png/ff4444/ffffff', 78, 'Izuuycfaebmcrlenaawdznfkphgvcvyfgzyozlalpitahsv', 1),
(50, 'Haliaeetus leucocephalus', 'http://dummyimage.com/152x100.png/cc0000/ffffff', 16, 'Gethxoqfimdnmzpsyapvtjkxroybcimveheoojlfpgyydnm', 4),
(51, 'Ara ararauna', 'http://dummyimage.com/236x100.png/cc0000/ffffff', 20, 'Uyweappzzmbcsctwsmpmgakmejseuyoqqowiqhgylfyyunf', 7),
(52, 'Ratufa indica', 'http://dummyimage.com/200x100.png/cc0000/ffffff', 51, 'Pnwanbgnbbrnlaoorkkjfbxfsjdykyeypntkjlipntqlvnx', 6),
(53, 'Laniarius ferrugineus', 'http://dummyimage.com/222x100.png/dddddd/000000', 26, 'Gbvysfkedwkylsfugqylxkkdusqtdpfylfknmvtgmnnsebs', 4),
(54, 'Alcelaphus buselaphus cokii', 'http://dummyimage.com/121x100.png/ff4444/ffffff', 32, 'Rbaerlceflblkgeijbptkqrvnaaaclplovsdjbkuomqnhsh', 10),
(55, 'Microcebus murinus', 'http://dummyimage.com/228x100.png/cc0000/ffffff', 15, 'Hombybbyfgdsxmftfilaupdgfqlheqwzdorpyvqziughkig', 5),
(56, 'Macropus rufogriseus', 'http://dummyimage.com/128x100.png/dddddd/000000', 43, 'Gqnfatuxzvbymkopzjbnthxkbrwelxkizfrssnsdniriufs', 8),
(57, 'Tamandua tetradactyla', 'http://dummyimage.com/200x100.png/dddddd/000000', 65, 'Arokxqhuzgjawzdreiytnebghbekqentdquibvxueejjeya', 5),
(58, 'Gymnorhina tibicen', 'http://dummyimage.com/118x100.png/ff4444/ffffff', 18, 'Zbkhxhvxtzfadtqvuhxtmdhpybrhtwxljgyiievuwlofuke', 7),
(59, 'Cereopsis novaehollandiae', 'http://dummyimage.com/180x100.png/5fa2dd/ffffff', 90, 'Fcfljlohidwhzgrfcwfjxyxswbmmbijtpdumbzwtaywdzag', 10),
(60, 'Plectopterus gambensis', 'http://dummyimage.com/121x100.png/5fa2dd/ffffff', 48, 'Qrdjdeibznftgucedzlnggtwnlubrrhjxgmlrxaedntqmob', 5),
(61, 'Anas bahamensis', 'http://dummyimage.com/217x100.png/dddddd/000000', 90, 'Bpzztdevngtxmasqknsavwhoetkgzkomgilwlluqoztudxy', 5),
(62, 'Paraxerus cepapi', 'http://dummyimage.com/193x100.png/5fa2dd/ffffff', 62, 'Lnkjorqohltbicvsfbltkluzvrxdvqoeaonmerofezhwjvb', 6),
(63, 'Bassariscus astutus', 'http://dummyimage.com/189x100.png/ff4444/ffffff', 10, 'Lewuywsnrrvlzgngjqvsrjgfaoiqmjjuniqafxydtsmnlvi', 10),
(64, 'Otaria flavescens', 'http://dummyimage.com/220x100.png/5fa2dd/ffffff', 52, 'Goyvgwptmqmdxixfxzasrgigxpmreryvporabdhbhfyrhnb', 4),
(65, 'Ardea golieth', 'http://dummyimage.com/192x100.png/ff4444/ffffff', 37, 'Axfjyjfqssgepetlnpaqvcdiarmkqtzavnzzcupxrbgxmhs', 7),
(66, 'Lamprotornis superbus', 'http://dummyimage.com/123x100.png/dddddd/000000', 47, 'Xdfyxcpgxnbhqvrfsuwalmvwjzkfbbaspsugfbvwjhufkks', 6),
(67, 'unavailable', 'http://dummyimage.com/182x100.png/5fa2dd/ffffff', 55, 'Tzsnczvgvjomnqajaodufhstlspzfgutpykfurioyqnliif', 7),
(68, 'Castor fiber', 'http://dummyimage.com/227x100.png/cc0000/ffffff', 29, 'Jjhpngovcuszzntbvuagdkqwijfhctujekajbmxfmunbqbj', 2),
(69, 'Zalophus californicus', 'http://dummyimage.com/130x100.png/dddddd/000000', 4, 'Izhmiuuxfwxcmykkfcfuyyuiksutqyzglsgfmieshvjbjbn', 7),
(70, 'Chamaelo sp.', 'http://dummyimage.com/172x100.png/cc0000/ffffff', 17, 'Olzhelwfhrogrqaexhhrjnilzfxbhvabuslecqeqvtcubzu', 3),
(71, 'Uraeginthus angolensis', 'http://dummyimage.com/173x100.png/dddddd/000000', 25, 'Iluyamxbfgkkbsedckcdzyxcxrsmctoozhqfhmxqlpbopdk', 2),
(72, 'Chelodina longicollis', 'http://dummyimage.com/233x100.png/ff4444/ffffff', 42, 'Zprrnklswblaszwkmdlbwskcuidqkvhhdcjbagzoomznukr', 8),
(73, 'Caiman crocodilus', 'http://dummyimage.com/208x100.png/dddddd/000000', 59, 'Fqrediyijsydpleichmqucldwraqptiwjgrnpqpvrrtnmck', 1),
(74, 'Gabianus pacificus', 'http://dummyimage.com/201x100.png/5fa2dd/ffffff', 41, 'Lhcztqssjldzhpzknkrzwngwxijfekjwiwsjcslcouvhzav', 9),
(75, 'Aonyx capensis', 'http://dummyimage.com/155x100.png/ff4444/ffffff', 100, 'Nmmluryjbrrnldljmwjjtxegdeilmzvvxdkvkbizvjdhwyb', 2),
(76, 'Graspus graspus', 'http://dummyimage.com/228x100.png/ff4444/ffffff', 87, 'Iouytogipifhgudfbcdiibrvwxcqjoqzymrkkrnaeiydcdd', 9),
(77, 'Scolopax minor', 'http://dummyimage.com/183x100.png/dddddd/000000', 12, 'Gowgsvocsgitfvmzjuapewnixyvovfdbbsmtckvoacdrhwx', 7),
(78, 'Coracias caudata', 'http://dummyimage.com/162x100.png/5fa2dd/ffffff', 35, 'Lvaemfmxnhbmppcxoxcvyiuwdkqoprrhlvjloexhmrratzu', 5),
(79, 'Varanus komodensis', 'http://dummyimage.com/177x100.png/5fa2dd/ffffff', 21, 'Tupclsywvkqhxfuznprksfnsbrfplrktjgxsfactjgcecvd', 3),
(80, 'Zosterops pallidus', 'http://dummyimage.com/161x100.png/ff4444/ffffff', 83, 'Gpiwxzssoptybtnjzfntcvliiewkpzpsyzbvyvalnppltkh', 3),
(81, 'Varanus sp.', 'http://dummyimage.com/227x100.png/5fa2dd/ffffff', 59, 'Vxavthwrcncuqkqomagieohqozweswkumnyluldrjdczwlg', 8),
(82, 'Bos taurus', 'http://dummyimage.com/116x100.png/ff4444/ffffff', 12, 'Sthbbrejysvzmxbfmuvodudajjewoxrrrakzrtzgcqjxnvm', 9),
(83, 'Rhea americana', 'http://dummyimage.com/131x100.png/dddddd/000000', 3, 'Vamntsufehajgmbhlhxbwangjsgkcodscgpobztuscydubi', 1),
(84, 'Cathartes aura', 'http://dummyimage.com/139x100.png/5fa2dd/ffffff', 3, 'Bvfmulhyxsvdwlaklohklumphvzztxgrvpmsfnkodhrawje', 6),
(85, 'Corvus albus', 'http://dummyimage.com/166x100.png/dddddd/000000', 77, 'Nhcitfpspqxehzybwvkfltcthtqymmuylfyhqhjapnpoofg', 8),
(86, 'Francolinus coqui', 'http://dummyimage.com/138x100.png/5fa2dd/ffffff', 47, 'Soztposjeykdyrzksthecmhxertbebmwjfcspcamqsanrha', 7),
(87, 'Haematopus ater', 'http://dummyimage.com/134x100.png/ff4444/ffffff', 47, 'Cfgotlssukoycuhbovltehdiqzobiepojwiqfdbleozxhwd', 5),
(88, 'Dasyurus maculatus', 'http://dummyimage.com/239x100.png/5fa2dd/ffffff', 37, 'Psnpyekucmzcmbqjynvniuyzwbaftcofhcirqqbfgcjxmhz', 8),
(89, 'Dicrurus adsimilis', 'http://dummyimage.com/114x100.png/dddddd/000000', 73, 'Whkaqcafhxyjkdejjeiszogifdmjkgnstgakktssrwtnncx', 9),
(90, 'Platalea leucordia', 'http://dummyimage.com/232x100.png/ff4444/ffffff', 73, 'Elmuwtzhcnyhnonxawzezwvgdxwdjoickbmhwfcybkvrdkd', 9),
(91, 'Varanus komodensis', 'http://dummyimage.com/177x100.png/cc0000/ffffff', 52, 'Pzbuomfnfphtnyunkzbcyxhvdqmjxyjezxpfkiawbsumfkv', 5),
(92, 'Psophia viridis', 'http://dummyimage.com/230x100.png/cc0000/ffffff', 37, 'Gdallyuhvxdgqxsnsmygbhhuvmynvjfppknmwdkviypzsni', 2),
(93, 'Ploceus intermedius', 'http://dummyimage.com/199x100.png/dddddd/000000', 48, 'Bmdpvdxoqfocynkdricjqdikhjbxjiulsfsdakbvgazfrpp', 5),
(94, 'Uraeginthus angolensis', 'http://dummyimage.com/133x100.png/ff4444/ffffff', 50, 'Kvhaluqrduykwvqkkhwxshsskyczmvnfgaistlkausjvddf', 5),
(95, 'Cebus apella', 'http://dummyimage.com/166x100.png/dddddd/000000', 59, 'Uyzrpnyzqurpjcmaduvtbleabvxafgsjcgfaxbdwmaxbkdj', 8),
(96, 'Lemur fulvus', 'http://dummyimage.com/101x100.png/ff4444/ffffff', 9, 'Lnklvfrtxbqtjnmsdlelnoyvqrlwwtqsguyfawwvfhjrqgq', 1),
(97, 'Macropus eugenii', 'http://dummyimage.com/206x100.png/5fa2dd/ffffff', 99, 'Tcjfjymsbnuvqqjdvfbxnasueniwkquvfmwwmvplaxrlrao', 9);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'sit');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'dolorem');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'libero');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'minus'),
(5, 'ipsam'),
(6, 'omnis'),
(7, 'repellat'),
(8, 'sit'),
(9, 'et'),
(10, 'explicabo'),
(11, 'sit'),
(12, 'dolorem'),
(13, 'libero'),
(14, 'minus'),
(15, 'ipsam'),
(16, 'omnis'),
(17, 'repellat'),
(18, 'sit'),
(19, 'et'),
(20, 'explicabo');

INSERT INTO `like_res` (`user_id`, `res_id`, `like_stat`, `date_like`) VALUES
(21, 1, 1, '2023-10-20 01:03:11');
INSERT INTO `like_res` (`user_id`, `res_id`, `like_stat`, `date_like`) VALUES
(21, 2, 0, '2023-10-22 21:56:52');


INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `date_order`, `code`, `arr_sub_id`) VALUES
(11, 1, 1, 3, '2023-10-19 16:17:12', 'avcsa', 'sadasdas');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `date_order`, `code`, `arr_sub_id`) VALUES
(12, 1, 1, 3, '2023-10-19 16:17:12', 'avcsa', 'sadasdas');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `date_order`, `code`, `arr_sub_id`) VALUES
(13, 1, 1, 3, '2023-10-19 16:17:12', 'avcsa', 'sadasdas');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `date_order`, `code`, `arr_sub_id`) VALUES
(14, 21, 1, 3, '2023-10-19 09:17:12', 'avcsa', 'sadasdas'),
(15, 21, 1, 3, '2023-10-19 02:17:12', 'avcsa', 'sadasdas'),
(16, 21, 1, 3, '2023-10-19 12:17:12', 'avcsa', 'sadasdas');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(21, 1, 2, '2023-10-22 21:54:11');


INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'laudantium', 'tmp//5576ed1c9626480808732ad47f5e9cd1.jpg', 'Facilis voluptate quia quas unde. Facere omnis ut quo ex odit praesentium laborum.');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'a', 'tmp//96e7b8175b5660ae0292450434ac1038.jpg', 'Accusamus et culpa dolorem est dolorem. Quidem et laboriosam velit aut nihil.');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'laudantium', 'tmp//5576ed1c9626480808732ad47f5e9cd1.jpg', 'Facilis voluptate quia quas unde. Facere omnis ut quo ex odit praesentium laborum.');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'a', 'tmp//96e7b8175b5660ae0292450434ac1038.jpg', 'Accusamus et culpa dolorem est dolorem. Quidem et laboriosam velit aut nihil.'),
(5, 'occaecati', 'tmp//a95b6509bc852741f09582474efdfed4.jpg', 'Ex quia quia quasi vero ut voluptas. Porro ullam quam perferendis laboriosam. Nesciunt officiis maiores inventore aliquam. Maxime non odio saepe maxime.'),
(6, 'maiores', 'tmp//2a49adfbd0618a76dc582484ec095e36.jpg', 'Assumenda ut minus molestiae dolores eum. Non minima iste amet ea nemo. Ipsam quae debitis qui sint.'),
(7, 'repellendus', 'tmp//369f50b93b2b90c1782a28142196d6a1.jpg', 'Dolorem animi ut est possimus rerum ipsum. Et perferendis voluptatem cumque voluptatem. Facere harum iusto et quas. Ipsam exercitationem nisi commodi sit est est temporibus vel.'),
(8, 'sint', 'tmp//0b8f5328f5055cbbf1f2a22bdfcdf012.jpg', 'Deserunt quia quo cumque saepe sequi praesentium nemo. Harum ex aut labore debitis est quis pariatur. Aut similique est molestiae dolorem quibusdam expedita et. Veniam tempore est impedit dolorum.'),
(9, 'voluptatem', 'tmp//22ace1d076413baf86c2f9baa9a63d93.jpg', 'Fugiat quisquam dolorem sapiente placeat nemo ea magni. Vel occaecati et eos voluptas suscipit expedita. Fugit quo nihil facilis debitis beatae quod laborum architecto. Odit qui impedit a voluptatum.'),
(10, 'exercitationem', 'tmp//42ee59b80d3e588cc6647c091aa9758c.jpg', 'Laborum quibusdam deleniti non voluptatem. Et architecto a non est et cumque deleniti. Similique nemo aut quo accusamus non quam.'),
(11, 'sunt', 'tmp//ddd9c70808dccbf646bd923b0329536e.jpg', 'Possimus non expedita voluptas autem temporibus voluptate praesentium. Esse est sit qui quia. Excepturi omnis eligendi et voluptatem distinctio alias. Tempore est ea consequatur sapiente.'),
(12, 'nesciunt', 'tmp//bad5269d346190aa06f31b010d2d22fd.jpg', 'Vitae ipsa placeat atque et magni. Voluptas dolore necessitatibus atque quibusdam sapiente. Modi rerum totam quisquam aliquam.'),
(13, 'voluptatem', 'tmp//5d7151f4b81edd57dda8aeb936a6d13a.jpg', 'Nihil ullam vel recusandae accusantium expedita porro illum. Ducimus provident inventore id placeat nisi. Debitis reiciendis exercitationem minima neque quo aut et animi.'),
(14, 'asperiores', 'tmp//b27ccc60428ed04f6507d29908078849.jpg', 'Et consectetur ut sed et. Fugiat esse ut eveniet. Iste possimus et corporis rem perferendis enim. Excepturi eum ea nostrum corporis occaecati quas ratione.'),
(15, 'aliquid', 'tmp//774edff181beb5af5c859bc861cd9e81.jpg', 'Perspiciatis commodi ratione suscipit ut dolore provident. Veritatis eos asperiores repudiandae exercitationem velit et. Necessitatibus nostrum rem quia.'),
(16, 'eius', 'tmp//0b04b74e212b7f74eea53b709b04b4f7.jpg', 'Illum possimus quo ex incidunt ea numquam iure. Nam voluptate tenetur eaque ut ut atque. Earum eaque quia enim et omnis. Ut consequatur magni quasi et tempore est temporibus.'),
(17, 'est', 'tmp//9799f953c0441ce37c3fc8247261015e.jpg', 'Quisquam rerum est ipsum pariatur assumenda sit et. Doloremque accusantium officiis nobis sapiente harum natus ut dolor. Libero vitae porro doloribus dicta natus enim.'),
(18, 'doloribus', 'tmp//5be12197d870dea35b545f3e11b6de5f.jpg', 'In saepe iure occaecati dolore. Accusantium ipsam blanditiis culpa repellendus doloremque reiciendis.'),
(19, 'provident', 'tmp//429e7c8f7c2a683d51a81139cae6c2d8.jpg', 'Blanditiis quos velit dolorem doloribus. Esse consequatur dolore autem. Soluta fuga ex quo amet quia eaque. Ut soluta sit cum dolores.'),
(20, 'quaerat', 'tmp//22fea412beebde2174058d0bf4460227.jpg', 'Aut et dolorem quia voluptate quibusdam consequatur dicta. Ut occaecati quaerat neque quae. Ducimus nesciunt sed sit rerum et nihil at. Vero corporis rerum consequatur sed.'),
(21, 'praesentium', 'tmp//6e43b3632e000d211075bdae87b3e872.jpg', 'Provident quos voluptate delectus at omnis ullam. Sed est ipsa laudantium in optio et. Aut eum laboriosam numquam eius expedita.'),
(22, 'unde', 'tmp//19042640307cd4f9fd4a3ee2542d781f.jpg', 'Sunt quia sit et doloremque ea. Nobis at ex qui vero quia. Quo suscipit qui facere. Placeat voluptatem incidunt fuga laudantium nobis. Iste autem repudiandae earum doloremque nostrum.'),
(23, 'illo', 'tmp//6d1523dba09df145726c5ee8aacb6382.jpg', 'Deleniti inventore maxime cumque quaerat. Ut doloremque doloremque blanditiis est voluptates corrupti. Ut minus aut cumque voluptate vel quae dolorem amet.'),
(24, 'possimus', 'tmp//37037e7461aba7e79d8e8e17aa3daaa9.jpg', 'Et est illo in iure dolor. Qui sed consequatur necessitatibus voluptatem vitae mollitia amet consectetur. Ut excepturi neque ducimus quae sunt.'),
(25, 'repellendus', 'tmp//7ba0636a72fd79890c02b3dfdd08ad86.jpg', 'Minima deserunt sed ut molestiae vero velit quo enim. Reiciendis quam ut est quibusdam repellendus. Rerum ipsa voluptatem qui ullam mollitia vero ea.'),
(26, 'ut', 'tmp//00392f750801c39c1cddbf06c201ad55.jpg', 'Facilis harum veniam sequi fuga in. Repudiandae animi necessitatibus quidem a saepe molestiae voluptatem. Id laborum sapiente ut id qui.'),
(27, 'nihil', 'tmp//f45ceae377324f4980d569f9bdceaf4c.jpg', 'Molestiae accusantium fugit nam quam sed totam. Et earum vel sed nisi hic et. Laborum molestiae totam labore provident dolor voluptatem qui. Quia aut dolorem aspernatur dolorum.'),
(28, 'ipsam', 'tmp//818546e49ef7f2ab21423afc0de1f209.jpg', 'Consequatur ipsa nobis est voluptas fuga neque. Assumenda corrupti quam voluptatem accusamus est sint. Molestiae sapiente voluptatem omnis est velit corporis.'),
(29, 'id', 'tmp//ad598e67b568dc30ef7ce5392eee2a2d.jpg', 'Aut aliquam laudantium eos asperiores ipsa dolor. Voluptatem sed nemo aut quasi nihil ut sint veniam.'),
(30, 'id', 'tmp//58236b2186605f1fedf2171b8ab411df.jpg', 'Qui in fuga qui molestiae. Quod assumenda nostrum sequi officia quasi. Dolore commodi veritatis earum facilis praesentium. Iure ipsa voluptas est cupiditate.'),
(31, 'deserunt', 'tmp//77cf4a117e2ac3112b34340242397675.jpg', 'Ea et minus accusamus possimus qui voluptas. Repellendus et magnam omnis dignissimos dolores reprehenderit magnam. Et assumenda a inventore voluptatem similique ut aliquam sapiente.'),
(32, 'eius', 'tmp//4c55f7dcc3d340e295a4e93d6189e5ff.jpg', 'Maxime corrupti iste pariatur vel consectetur asperiores. Omnis eos deserunt aperiam autem. Neque illo ut sit aut repudiandae inventore. At ut accusamus vero vel ducimus quia tempore hic.'),
(33, 'laboriosam', 'tmp//6e149f56a45f74ab1cec2c48c50fbdd0.jpg', 'Id consequatur aut dicta. Quo eum tempore quas facere voluptatem. Est mollitia est vel.\nNam aut consectetur odit. Inventore vero autem dolor. Dolor sint in ut sunt magnam.'),
(34, 'et', 'tmp//ab383510ac9be8c09da2055605367ce2.jpg', 'Voluptatem quis possimus quis deserunt pariatur qui iusto unde. Eius sequi et cumque molestias laudantium. Dolores nobis quod possimus sunt impedit.'),
(35, 'eius', 'tmp//9e0b2f37e51950fd3fd4622b4ef93daa.jpg', 'Porro nihil sequi recusandae assumenda minima consequatur. In est nulla eos quos omnis quam aut.'),
(36, 'et', 'tmp//43ff5ba59b3839ac33eebffb855654be.jpg', 'Tempore sit et ab tempora quia quo. Expedita id molestias molestiae aut illo est. Aut odio odit nesciunt est optio ut. Et similique eaque placeat est voluptatem ut magnam.'),
(37, 'eligendi', 'tmp//224aa90a3a80ab056673af2b4e5f1065.jpg', 'Odio et est id dolorem sed. Deleniti corporis voluptatibus esse incidunt aliquam. Quae sed quo ex possimus rerum. Id et ipsum ullam reiciendis. Qui voluptatibus itaque doloribus.'),
(38, 'libero', 'tmp//19c3ddab7598c27dd3ac7b2216171c77.jpg', 'Magni temporibus minus corporis eos. Magni voluptas laborum saepe placeat. Soluta sed eos doloribus rerum odio. Molestiae explicabo fugiat adipisci repellat quidem.'),
(39, 'voluptate', 'tmp//e32432fcaa05d5318f5b241676552d23.jpg', 'Eum corrupti velit cupiditate illum. Quaerat earum sequi suscipit ducimus velit a. Optio in quaerat eaque sunt. Aspernatur qui optio saepe.'),
(40, 'quo', 'tmp//3cdf23ef9f1e17af0ac667e2b0b6488a.jpg', 'Quo modi asperiores modi maiores. Quia ullam dolorem vel autem. Libero qui molestias consectetur voluptas quia. Magni qui amet libero.'),
(41, 'libero', 'tmp//ee0f391b48257480b6d5c4f3e56c3ab9.jpg', 'Facilis at omnis sed laudantium ab. Maxime nisi rerum et eaque. Dolor quo quam asperiores ab fuga ducimus nulla soluta. Vero voluptates excepturi dolores dolorem tempora atque.'),
(42, 'cupiditate', 'tmp//c0a51891e77d8a9443832d108bf4a527.jpg', 'Dolorem alias aut voluptatem amet deleniti nesciunt. Iusto sint consequuntur dolorum ad in sint. Et eum iusto cupiditate ad saepe.'),
(43, 'nisi', 'tmp//786fa332db0ad9b2546c5dc7f1de5099.jpg', 'Et omnis nihil at. Et mollitia eos earum optio eligendi iure consequatur. Asperiores dolores corporis sequi suscipit. Voluptatem pariatur voluptas eius magni.'),
(44, 'qui', 'tmp//bdfe125b5a021cb3e56815bab35efd58.jpg', 'Optio consequatur aspernatur impedit quis vero dignissimos. Quibusdam accusantium id impedit commodi sunt neque. Explicabo laudantium unde ut.'),
(45, 'alias', 'tmp//7fd6b86afda336bfdfea78ffc8bb84c5.jpg', 'Praesentium ut quam deserunt omnis dolorem minima beatae fugiat. Dolore vel consequatur eius incidunt. Quis iure illum laboriosam aut nemo qui. Consequatur provident facilis distinctio expedita.'),
(46, 'est', 'tmp//c29128135cca2e7f749a880a31eef543.jpg', 'Ad illo ut deleniti vel sed repellat quas. Nulla reprehenderit natus ipsa quas. Saepe dolor qui accusamus minima natus quibusdam labore.'),
(47, 'est', 'tmp//4149b0c376c6c138b7f622791f9fa2a7.jpg', 'Aliquid fugiat magni possimus eum nobis minima. Id odio unde aperiam. Eaque distinctio nihil explicabo in voluptatem saepe ratione.'),
(48, 'consequatur', 'tmp//8d9b5be912f19ed76aa6f7172c46f1cd.jpg', 'Vero dolorem animi qui dolorum. Fugit sit et voluptatem unde incidunt cumque.'),
(49, 'facere', 'tmp//1892236552eda64ca849c1b69309c108.jpg', 'Alias eum harum nesciunt ut voluptatem enim. Repellendus necessitatibus adipisci modi facere. Architecto distinctio officiis qui blanditiis repellendus tenetur praesentium.'),
(50, 'aliquid', 'tmp//03c3d65777e3acd4282c2c2d092ca5e8.jpg', 'Deserunt laboriosam similique quo sit eum ut commodi. Maxime quaerat tenetur quis praesentium alias velit ut magni. Aspernatur atque itaque qui ut mollitia quasi et.'),
(51, 'neque', 'tmp//670afe06726d07c5c8db2ce7e2665c10.jpg', 'Rerum omnis dolore sed accusamus recusandae. Minima voluptas dolorem voluptatem molestias hic. Nesciunt excepturi excepturi exercitationem. Sed modi et at quo blanditiis et est.'),
(52, 'nulla', 'tmp//ee6f2e8925902be52ca32c805716493c.jpg', 'Rerum similique ipsam est ea consequatur ipsa voluptatum. Et blanditiis omnis et et quia commodi officiis. Saepe at et velit. Nemo unde nemo omnis voluptatum ut sit optio modi.');



INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Kaylyn Jacqueme', 'kjacqueme1@goodreads.com', '$2a$04$LvIBVHHh5GOv1i9jObBu2u6h90M8K4UmNP9PnyqCHgA4MJJx8Zw42');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Millie Runacres', 'mrunacres0@kickstarter.com', '$2a$04$ht.vjOQ.xT42kWMa4I6oWe0vLNmoCo0uA0er0.D94hmD3.hbNaYrq');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Pepito Coke', 'pcoke2@lulu.com', '$2a$04$KP19SkdZZiNEaNtdfhEn6O34QGK7P5HDhFIvLRTfi1.j0zLt5F4v2');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Deeann Gunnell', 'dgunnell3@adobe.com', '$2a$04$uQcyJheVplQ4J7L6qsJXAunqQNiTlRjLrFMSrzAKtXU2ERS2vIHXS'),
(5, 'Nerissa Checchetelli', 'nchecchetelli4@nationalgeographic.com', '$2a$04$60HMo.nnzHVDcuT5vOI1a.KT37wiGo1UAsCR2MwByJuqltr2lJq6y'),
(6, 'Morley Ellsworthe', 'mellsworthe5@state.gov', '$2a$04$wO6L6CFvZmYmbxPWNcjxg.KVJo9ontieVAMrpem9Br8/i5nEZtjeW'),
(7, 'Astra Wortt', 'awortt6@liveinternet.ru', '$2a$04$ZGCt0TICDpycFixbh1g1H.yIqV6oBZAylAAqyd./2M0GZGG4b2h3q'),
(8, 'Laural Burdon', 'lburdon7@woothemes.com', '$2a$04$EOp8hGX0HK7kl8/VDwaJo.8Ru/xRu5Ue5kI1doqrF1MHla2W0jxH6'),
(9, 'Lorene Robet', 'lrobet8@google.es', '$2a$04$zMHrfZL1cCnjwE3u/j42W.o9Trjquhg4zB8JJZUi3LNcgk1XxNpTS'),
(10, 'Melany Yakutin', 'myakutin9@slideshare.net', '$2a$04$w05GaMrIy9N69ZL0kHZZKOUrkLhN.KHo8/fEvDJbUjpFo3k64jGUW'),
(11, 'Ely Ringsell', 'eringsella@washington.edu', '$2a$04$5HLu7ZQ7rdgJZe0ECP7dfOVsvVkkhyrIKhAfeSQ8LWM1SpA2rzDeu'),
(12, 'Farlay Davern', 'fdavernb@flavors.me', '$2a$04$VnbLDWrTCRF33TechAeUTumf8nmMhRWs3wENj21TAg5rsZNhxxRge'),
(13, 'Pietrek Wivell', 'pwivellc@hibu.com', '$2a$04$A6TQPI0xNNjZO0rPRFEeuO9kAtrv71FYOc8/JMtFRNILFHa5HeqQy'),
(14, 'Hattie Danneil', 'hdanneild@clickbank.net', '$2a$04$oQ2YtGO.ZbZA9LkJzN3Lp.d1eR4KvUfOdVntvl.w05oyeJWcybPdu'),
(15, 'Eva Artus', 'eartuse@elpais.com', '$2a$04$K.slc3pMGgUNqBoL.D72yeGD8zOgmksBuFSyOBpw.EOuSlyXNdQJy'),
(16, 'Kissee Warlawe', 'kwarlawef@sciencedirect.com', '$2a$04$YOiD.z9myAyo8//PZTKXjel0dYbVb11TMOLyH3YjMEx95SMPmPGWa'),
(17, 'Aldric Trickett', 'atrickettg@zdnet.com', '$2a$04$eRgdogP4UjPIY/ZloKIrhOwZM/1XrZjrHLXvbYlGtMHgcGtKn7CE2'),
(18, 'Letizia Darch', 'ldarchh@homestead.com', '$2a$04$7zpQl6GyN4wDP7AulCgLu.WTeZJ0HeuI2y2AmO0LDRQt87uQSbrJm'),
(19, 'Esmaria Dowse', 'edowsei@livejournal.com', '$2a$04$M.jJAolUJ6Hdad3PtkFxP.S4JOixwDfEHmjubBdO9qTYsIxEU/Gcu'),
(20, 'Fonsie Larkin', 'flarkinj@1und1.de', '$2a$04$TIJ5q32n7b7/n56imxRA7eMlPvPG.wonuIADWOHq3YNb7NDiQknta'),
(21, 'Le Tuan Kiet', 'kaset@gmail.com', '$2b$10$yELnOBHly7K05lMJKpXJPeFTmmXrb5DB33.f3vXj8b4ClS2kyglaK');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;