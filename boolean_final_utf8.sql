-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: boolean_final
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'DC Comics','brands/dc-logo-313x313.svg','DC Comics è una delle principali case editrici americane di fumetti, conosciuta per personaggi leggendari come Batman, Superman, Wonder Woman e per universi narrativi che hanno influenzato generazioni di lettori.','2026-06-16 16:08:31','2026-06-16 16:08:31'),(2,'Marvel Comics','brands/marvel-logo.svg','Marvel Comics è una storica casa editrice statunitense di fumetti fondata nel 1939, conosciuta in tutto il mondo per aver creato alcuni dei personaggi più celebri della cultura pop, tra cui Spider-Man, Iron Man, Captain America e gli Avengers.','2026-06-16 16:09:58','2026-06-16 16:09:58');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_comic`
--

DROP TABLE IF EXISTS `character_comic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_comic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comic_id` bigint(20) unsigned NOT NULL,
  `character_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_comic_comic_id_foreign` (`comic_id`),
  KEY `character_comic_character_id_foreign` (`character_id`),
  CONSTRAINT `character_comic_character_id_foreign` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `character_comic_comic_id_foreign` FOREIGN KEY (`comic_id`) REFERENCES `comics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_comic`
--

LOCK TABLES `character_comic` WRITE;
/*!40000 ALTER TABLE `character_comic` DISABLE KEYS */;
INSERT INTO `character_comic` VALUES (1,11,1,NULL,NULL),(2,11,7,NULL,NULL),(3,11,8,NULL,NULL),(4,1,1,NULL,NULL),(5,6,9,NULL,NULL),(6,7,9,NULL,NULL),(7,3,8,NULL,NULL),(8,2,7,NULL,NULL),(10,2,1,NULL,NULL),(11,2,8,NULL,NULL),(12,12,14,NULL,NULL),(13,13,13,NULL,NULL),(14,14,15,NULL,NULL),(15,15,11,NULL,NULL),(16,16,11,NULL,NULL),(17,18,1,NULL,NULL),(18,19,16,NULL,NULL),(19,20,9,NULL,NULL),(20,21,17,NULL,NULL),(21,22,1,NULL,NULL),(22,22,8,NULL,NULL),(23,22,11,NULL,NULL),(24,22,12,NULL,NULL),(25,22,13,NULL,NULL),(26,23,1,NULL,NULL),(27,23,11,NULL,NULL),(28,20,17,NULL,NULL),(29,24,9,NULL,NULL),(30,24,16,NULL,NULL),(31,25,9,NULL,NULL),(32,25,14,NULL,NULL),(33,26,15,NULL,NULL),(34,2,20,NULL,NULL),(35,27,22,NULL,NULL),(37,29,21,NULL,NULL),(38,30,18,NULL,NULL);
/*!40000 ALTER TABLE `character_comic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `character_img` text DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'THE FLASH','characters/r8wY0Ri17Rfxkbk7wFbFktJSETjCDNITmB5jUiCE.avif','characters-banner/x7RMOHcT8ClPfG0YHyfyqmxcXpxkUffYXEAy6nIy.jpg','Tre uomini hanno portato il titolo di **\"Uomo più veloce del mondo\"**: **Jay Garrick, Barry Allen e Wally West**. Ognuno di loro ha ridefinito il significato della parola *eroe*. Il misterioso potere conosciuto come **Forza della Velocità (Speed Force)** è un campo energetico che, nel corso dei secoli, ha conferito incredibili capacità di velocità a determinati eroi. Il più celebre tra loro è **Flash**, noto anche come l\'Uomo più veloce del mondo. Fin dai tempi della Seconda Guerra Mondiale, un uomo vestito di rosso è stato in grado di correre a velocità impossibili, utilizzando i suoi poteri per salvare vite e proteggere chi non può difendersi da solo. Tutto questo nello spazio di una frazione di secondo. Negli anni Quaranta, lo studente universitario **Jay Garrick** ottenne i suoi poteri di supervelocità a seguito di un incidente di laboratorio e divenne il primo supereroe della DC a portare il nome di Flash. Anni dopo, Jay venne succeduto dallo scienziato della polizia **Barry Allen**, finché il giovane partner di Barry, **Wally West**, raccolse la sua eredità in un periodo in cui Barry era ritenuto morto. Quando però Barry fece ritorno, riprese nuovamente il ruolo di Flash. Tutte e tre le generazioni di velocisti sono state membri fondamentali sia della **Justice Society** che della **Justice League**. Flash non domina soltanto la velocità, ma anche il tempo stesso, e ha spesso utilizzato i suoi poteri per viaggiare attraverso epoche diverse e persino in altre dimensioni. Sebbene non sia sempre stato abbastanza veloce da sfuggire alle tragedie personali che hanno colpito la sua vita, ha sempre fatto tutto il possibile per impedire che lo stesso accadesse agli abitanti di **Central City** e **Keystone City**. Proprio per questo si è guadagnato un posto tra i più grandi supereroi che l\'Universo DC abbia mai conosciuto.','2026-06-19 06:49:52','2026-06-23 14:13:33'),(7,'REVERSE-FLASH','characters/TMOF7F6pPRJ0ucpCY2mSFBBPY1Q7RPzP0B15QUnG.avif','characters-banner/FYdRRnyhpgOBX5S9RnAcyFVKR01ar2ts4amVFUaF.jpg','Per ogni azione esiste una reazione uguale e contraria. E a ogni passo che **Flash** compie verso il futuro, qualcuno dal futuro corre all\'indietro nel tempo per fermarlo: il malvagio velocista conosciuto come **Reverse-Flash**.\r\nNato nel XXV secolo, **Eobard Thawne** crebbe idolatrando Flash e studiando l\'eredità del Velocista Scarlatto. Tuttavia, man mano che imparava di più sul suo eroe, Eobard scoprì quanto la propria vita fosse legata a quella di Flash: era destinato a diventare uno dei più grandi nemici di **Barry Allen**. Questa rivelazione lo portò lentamente alla follia. Quando riuscì a replicare l\'incidente chimico che aveva conferito a Flash la supervelocità, Eobard assunse una nuova identità: quella di **Reverse-Flash**, una perversa distorsione di tutto ciò che Flash rappresenta.\r\nDotato di poteri e abilità simili a quelli di Flash, Reverse-Flash è incrollabile nella sua determinazione a opporsi e distruggere tutto ciò che è importante per il suo nemico. La sua capacità di viaggiare nel tempo gli permette di attaccare Flash praticamente in qualsiasi momento della storia. Tuttavia, non può mai ucciderlo: se eliminasse la sua stessa fonte d\'ispirazione, Reverse-Flash cesserebbe di esistere. Per questo motivo dedica ogni sua energia a tormentare e torturare l\'eroe, come un oscuro visitatore proveniente da un futuro che Flash non avrebbe mai potuto immaginare.','2026-06-19 07:41:08','2026-07-15 09:46:54'),(8,'AQUAMAN','characters/uHwTcePIloIYpj6tVvFRqrXtGEywEd2OEdkPuGu5.avif','characters-banner/ZaC6AjtmpsuWV95lt1Grk95Yq5X1ydox3DhkKGSp.jpg','Figlio di un guardiano di faro e di una regina di Atlantide, **Arthur Curry** è il ponte tra il mondo della superficie e il tumultuoso regno degli abissi.\r\nSovrano del regno sottomarino di **Atlantide** e Re dei Sette Mari, **Aquaman** è uno dei più potenti supereroi della DC, al comando di un regno che copre tre quarti della superficie terrestre, comprese tutte le creature che popolano gli oceani. Arthur Curry ebbe origini umili: gran parte della sua vita la trascorse lontano dalla sua patria, ignaro delle proprie nobili origini. Quando finalmente salì al trono in età adulta, divenne il re più leggendario della storia di Atlantide.\r\nMembro fondatore della **Justice League of America**, Aquaman ha combattuto al fianco di **Superman**, **Batman** e **Wonder Woman**, tenendo testa alle più grandi minacce che l\'universo abbia mai conosciuto. Sebbene molti lo considerino erroneamente un eroe che si limita a \"parlare con i pesci\", la sua forza sovrumana e le sue straordinarie capacità di combattimento lo rendono da sole un avversario formidabile. Inoltre, i suoi poteri telepatici fanno di lui una delle menti più potenti del pianeta. Chiunque scelga di sottovalutare il Re dei Mari lo fa a proprio rischio e pericolo.','2026-06-19 07:43:01','2026-07-15 09:47:05'),(9,'SPIDER-MAN','characters/cfLQjI0aeVIUOsrWaXPDjruc1CjBs45Jr3Daortb.webp','characters-banner/HjiK9MdIjRGUzmmWgs8Rq74lfzHNaAQUryWSOtYe.jpg','In un altro mondo, dove un ragno radioattivo non ha mai morso Peter Parker, l\'uomo sposato e padre di due figli riceve una seconda possibilità e inizia a combattere il crimine nei panni di Spider-Man.','2026-06-19 07:45:27','2026-06-23 14:16:23'),(11,'BATMAN','characters/kKdhZZHsJppqqm5EuyKtI6JY7QVduzKKMn3Isbme.avif','characters-banner/JoPvXTZ2oxoJDSFTrLA1GLGshR2cif1vFTAp9jTH.jpg','Uno dei personaggi di fantasia più iconici al mondo, **Batman** ha dedicato la sua vita a una crociata senza fine, una guerra contro ogni criminale nel nome dei suoi genitori assassinati, che gli furono strappati via quando era soltanto un bambino. Da quella tragica notte, ha allenato il proprio corpo e la propria mente fino a raggiungere livelli vicini alla perfezione fisica, trasformandosi in un supereroe costruito con le proprie forze. Ha sviluppato un arsenale tecnologico capace di far impallidire molti eserciti e ha fondato e guidato squadre di eroi della DC come la **Justice League**, gli **Outsiders** e **Batman Incorporated**.\r\nMilionario playboy durante il giorno, la doppia vita di **Bruce Wayne** gli permette di godere dei privilegi di una fortuna sconfinata, dell\'aiuto del fedele maggiordomo e tutore **Alfred Pennyworth** e di una base operativa perfetta situata nell\'antica rete di caverne sotto la vasta tenuta di famiglia. Di notte, però, abbandona ogni apparenza, indossa il suo iconico mantello e il caratteristico cappuccio con le orecchie a punta e si avventura tra le strade oscure, i tetti e i cieli di **Gotham City**.\r\nÈ la vendetta. È la notte. È Batman.','2026-06-19 12:47:15','2026-07-15 09:47:19'),(12,'SUPERMAN','characters/hkoKAB5axDjcWz3hzr8r4IzMDMx4d5LqWzoAR1Mc.avif','characters-banner/Fbk0yid0H5TtvSPoCInREQjhazhS6YJ8fGWFIr6C.jpg','Più veloce di un proiettile, più potente di una locomotiva... **L\'Uomo d\'Acciaio** combatte una battaglia senza fine per la verità, la giustizia e un domani migliore.\r\nDalla sua uniforme blu al mantello rosso svolazzante, fino all\'inconfondibile simbolo a forma di \"S\" sul petto, **Superman** è uno dei supereroi DC più riconoscibili e amati di tutti i tempi. L\'Uomo d\'Acciaio è il simbolo per eccellenza di verità, giustizia e speranza. È il primo supereroe del mondo e una fonte d\'ispirazione per tutti.\r\nPunta di diamante di una rivoluzione che ha cambiato per sempre il panorama della cultura pop, Superman ha trascorso oltre ottant\'anni a ridefinire il significato di stare dalla parte del bene. Ultimo sopravvissuto del pianeta condannato **Krypton**, cresciuto nella tranquilla cittadina di **Smallville**, in Kansas, Superman è tanto una leggenda quanto un uomo: il modello assoluto di eroismo, compassione e responsabilità.\r\nSebbene i suoi poteri lo rendano quasi simile a una divinità rispetto agli esseri umani che lo circondano, la sua storia non parla di avidità o conquista. Al contrario, Superman si impegna a rappresentare la bontà innata dello spirito umano e la capacità di ogni essere vivente di fare ciò che è giusto per il bene del prossimo.','2026-06-19 12:48:10','2026-07-15 09:47:33'),(13,'DOOMSDAY','characters/2ChH8dvlqZXWQand3qvuGpxgub9WbcsosHzWdHzd.avif','characters-banner/ZhSCIzbB8MV5hGwwkPmf0prGdJw6lbrK7CKxnj2N.jpg','**Doomsday** è un\'arma vivente forgiata nelle condizioni più estreme immaginabili, una forza definitiva e inarrestabile di distruzione e devastazione.\r\nMolto tempo fa, gli scienziati del pianeta **Krypton** crearono una creatura destinata a diventare l\'arma perfetta. Questa creatura, conosciuta come **l\'Ultimo**, non aveva altro scopo se non quello di distruggere. Attraversò numerosi mondi seminando morte e caos prima di essere infine sconfitta. Sepolto sul primitivo pianeta **Terra**, il mostro rimase dormiente per secoli, fino a quando si risvegliò e tornò a portare devastazione, guadagnandosi il nome di **Doomsday**.\r\nLa creatura venne infine fermata da **Superman**, che apparentemente perse la vita nello scontro. Guidato da un istinto primordiale che lo spinge a dare la caccia agli abitanti del suo pianeta d\'origine, Doomsday è riemerso più volte nel corso degli anni per minacciare Superman e il mondo che ha scelto come casa. Nulla può fermarlo e nessun ostacolo è in grado di distoglierlo dal suo unico obiettivo: distruggere tutto ciò che incontra sul suo cammino.','2026-06-19 12:49:43','2026-07-15 09:47:45'),(14,'WOLVERINE','characters/JK3h5vyQ4N3qQFcfYccVAiQPHDLmSCzNeL7GVe2C.webp','characters-banner/UBHkk8pu3jyNWMUxAZEXlbSykAyqLW8kOE0tscLx.jpg','Mutante dotato di un incredibile fattore rigenerante, di artigli di **adamantio** e di un carattere duro e senza compromessi, l\'uomo conosciuto come **Logan**, o **Wolverine**, è uno degli eroi più feroci dell\'universo.\r\nLa sua straordinaria capacità di guarire rapidamente da qualsiasi ferita gli consente di sopravvivere a battaglie che sarebbero fatali per chiunque altro. Lo scheletro e gli artigli rivestiti di adamantio, uno dei metalli più resistenti esistenti, lo rendono un combattente temibile sia a distanza ravvicinata che sul campo di battaglia.\r\nNonostante il suo temperamento aggressivo e il suo atteggiamento spesso burbero, Wolverine possiede un forte senso dell\'onore e della lealtà verso i suoi amici e compagni. Nel corso degli anni ha combattuto al fianco degli **X-Men**, degli **Avengers** e di numerosi altri eroi, affrontando minacce di ogni genere. Dietro l\'aspetto da guerriero solitario si nasconde però un uomo tormentato dal proprio passato, alla costante ricerca della propria identità e di un posto nel mondo.\r\nGrazie alla sua determinazione incrollabile, ai suoi istinti affinati e alla sua incredibile resistenza, Wolverine è diventato una leggenda vivente e uno dei personaggi più iconici dell\'Universo Marvel.','2026-06-19 12:56:41','2026-07-15 09:48:01'),(15,'CAPTAIN AMERICA','characters/VQ2QW3tvhYGODpnbP6ZhbpErwQFBQEMLezWceiYH.jpg','characters-banner/vn7jLw9LUosDIHbTvBzgZUjzQ611vsvLBnzJOlOH.jpg','Captain America è uno dei simboli più importanti dell’universo Marvel: un eroe che rappresenta coraggio, sacrificio e senso della giustizia. Dietro lo scudo c’è Steve Rogers, un giovane soldato trasformato nel supersoldato perfetto grazie al **Siero del Supersoldato** durante la Seconda Guerra Mondiale.\r\nDotato di forza, agilità, resistenza e riflessi superiori a quelli di un essere umano comune, Captain America combatte il crimine e le minacce globali usando soprattutto il suo iconico scudo di vibranio, diventato il simbolo della sua determinazione e della sua volontà di proteggere gli altri.\r\nNonostante sia un guerriero eccezionale, la sua vera forza non deriva dai poteri, ma dai suoi ideali: lealtà, disciplina e la capacità di restare dalla parte della gente anche quando il mondo intorno a lui cambia. È stato un membro fondamentale dei Avengers e uno dei più grandi leader della comunità supereroistica Marvel.\r\nIn poche parole: un uomo fuori dal tempo con uno scudo rotondo, perché evidentemente anche la geometria aveva bisogno di un eroe.','2026-06-19 13:16:02','2026-07-15 09:48:15'),(16,'IRON MAN','characters/njIy6caukj24Mj9SHwM9s1SjJIfgwwgGHsCiL6eq.webp','characters-banner/kRP4btskqUWpAzhSCd9i3ZQJ6w9TYnmjUJgkp3uI.jpg','Genio. Miliardario. Filantropo.\r\nLa sicurezza di Tony Stark è pari soltanto alle sue straordinarie capacità in volo nei panni dell’eroe chiamato Iron Man.','2026-06-19 13:31:29','2026-07-15 09:48:28'),(17,'MILES MORALES','characters/NmgH9eZx41GPoTwHtQ2qmHzUQbQ7bBb9EnA37u7z.webp','characters-banner/XvfBmrsnd6Cj1xZfNGZASSFYgHw8DITexhzYMUQm.jpg','Proveniente da un universo che aveva bisogno di un nuovo Spider-Man, un adolescente di Brooklyn di nome Miles Morales ha raccolto la sfida.\r\nInizialmente riluttante, ha presto dimostrato di essere degno del ruolo di Super Eroe.','2026-06-19 13:37:48','2026-07-15 09:48:36'),(18,'GREEN ARROW','characters/thTgmrk4VHDDh5lR5Sjd2gotOrmZpWGuGfWgBvfj.avif','characters-banner/W38vYOopiV18XdfOd37pHLVK9qStrB0TPJi0RFGh.jpg','Il miliardario Oliver Queen usa sia la sua immensa ricchezza sia le sue straordinarie abilità con l’arco nei panni dell’arciere combattente della Justice League: Green Arrow.\r\nSebbene molti lo considerino semplicemente una versione moderna di Robin Hood, Green Arrow è molto più di quanto questa descrizione limitata possa far pensare. Nato in una famiglia ricca e privilegiata, Oliver Queen diede tutto per scontato fino a quando una tragedia in mare cambiò la sua vita, lasciandolo solo su un’isola deserta. Lì Queen dovette scavare dentro sé stesso per scoprire se possedeva la forza d’animo necessaria per sopravvivere. Durante gli anni trascorsi sull’isola, Oliver affinò le sue già formidabili capacità con l’arco, fino a diventare il più grande arciere mai conosciuto.\r\nQuando finalmente fece ritorno alla civiltà, intraprese una carriera come vigilante urbano, cercando di liberare le strade della sua città natale, Seattle, e successivamente di Star City, dal crimine e dalla corruzione usando soltanto arco e frecce. Considerato dal mondo esterno come un playboy viziato, Green Arrow è in realtà profondamente interessato alle difficoltà dei più poveri e alle ingiustizie sociali negli Stati Uniti, forse più di qualsiasi altro supereroe mascherato: un vero e proprio “guerriero della giustizia sociale” nel senso più autentico del termine.\r\nPur essendo un uomo imperfetto, incline a commettere errori nella sua vita privata probabilmente più di molti altri combattenti del crimine, Green Arrow rimane comunque uno dei più grandi eroi dell’intero universo DC. Che combatta da solo, al fianco della sua compagna sentimentale Black Canary o insieme agli altri eroi della Justice League, l’Arciere Smeraldo è uno di quei guerrieri che chiunque sarebbe fortunato ad avere dalla propria parte.','2026-07-07 13:11:47','2026-07-15 09:48:51'),(19,'CATWOMAN','characters/O4Eglm1pb5sX9QDTjEbVBEd7kTJRV9EwRtceyavN.avif','characters-banner/AR456dXP5ZtHlkwlkvCdZnGz1dYVy0PzTij4i4ud.jpg','**Letale quanto affascinante, l’infame ladra acrobatica Selina Kyle usa le sue nove vite per camminare sul filo sottile tra luce e oscurità a Gotham City.**\r\nIl Pipistrello può essere il re delle creature di Gotham. Ma il Gatto? Il Gatto è senza dubbio la regina. La famigerata ladra Selina Kyle è certamente uno dei personaggi più iconici dell’Universo DC, non perché sia una supereroina in senso stretto, ma perché è incredibilmente brava nel mettere in difficoltà gli eroi. Spinta in parte dal proprio interesse personale e in parte dal semplice piacere della sfida, Catwoman ha ingannato e messo alla prova gli eroi di Gotham City, sia quelli mascherati sia quelli senza maschera, fin dalle sue prime apparizioni.\r\nAbile ladra di gioielli e talvolta eroina lei stessa, la bussola morale ambigua di Selina ha reso il suo rapporto con Batman estremamente complicato, per usare un eufemismo. Nonostante ciò, l’attrazione irresistibile tra il Pipistrello e il Gatto rimane una delle poche certezze di Gotham: ovunque vada Catwoman, Batman è quasi sempre pronto a seguirla, anche solo per fermarla. È un complicato gioco del gatto e del topo (o del gatto e del pipistrello?) che Bruce e Selina portano avanti da moltissimo tempo tra le strade e i tetti di Gotham.','2026-07-07 13:14:47','2026-07-15 09:49:19'),(20,'GREEN LANTERN','characters/1A6CgV8ncU73No9YztKp7m9ht7XG7SQl9RdqPg3z.avif','characters-banner/YD5MaAcMqcyy22bs5pOnJQQkaX2g9BhSXf8ORFqj.jpg','**Il pilota collaudatore Hal Jordan passò dall’essere una novità, il primo essere umano mai scelto come Lanterna Verde, a diventare una delle Lanterne più leggendarie ad aver mai impugnato un anello del potere.**\r\nLa vita di Hal Jordan cambiò due volte a causa dello schianto di un velivolo. La prima volta avvenne quando assistette alla morte di suo padre, il pilota Martin Jordan. La seconda quando, ormai adulto e diventato a sua volta un pilota esperto, venne richiamato verso i resti di un’astronave precipitata appartenente a un alieno di nome Abin Sur. Abin gli rivelò di essere un membro del Corpo delle Lanterne Verdi, un’organizzazione composta da esseri provenienti da ogni angolo del cosmo, armati di anelli del potere alimentati dall’energia verde della volontà di tutto l’universo. Prima di morire, Abin affidò a Hal il suo anello e il compito di diventare la Lanterna Verde del settore spaziale della Terra.\r\nLa vita di Hal come Lanterna Verde non è stata affatto semplice. Ha dovuto affrontare non solo nemici, ma spesso anche amici, colleghi e persone a lui care. Nonostante le difficoltà che la sua identità da Lanterna Verde ha portato nella sua vita, Hal rimane un uomo onesto, capace di agire senza paura e sempre pronto a proteggere chi ha bisogno di aiuto, sia da solo, insieme al Corpo delle Lanterne Verdi, sia al fianco della Justice League e degli altri supereroi della Terra.\r\nPerché Hal ha pronunciato il giuramento di ogni Lanterna Verde: **nessun male sfuggirà al suo sguardo.**','2026-07-07 13:19:32','2026-07-15 09:49:38'),(21,'HULK','characters/Y1vPkuxqpFJXwiU3aYstsXqritAHV5wVdLim0x9y.jpg','characters-banner/Sl0WrUWHknwfe95LqjzWT1PIIiZKnVFdMQ1VdOGo.jpg','**Bruce Banner**, cresciuto con un padre violento, sviluppò fin da giovane un carattere timido e un talento straordinario per la fisica nucleare. Le sue ricerche lo portarono a lavorare in una base militare nel deserto del Nuovo Messico, dove progettò una bomba a raggi gamma.\r\nDurante il collaudo dell\'ordigno, Banner si lanciò in soccorso del giovane Rick Jones, rimasto accidentalmente nell\'area di test. L\'esplosione lo investì in pieno con le radiazioni gamma, ma invece di ucciderlo provocò una trasformazione senza precedenti: Banner divenne Hulk, una gigantesca creatura dalla forza smisurata.\r\nCon l\'aiuto di Rick Jones, Bruce cercò di mantenere segreta la sua condizione e di trovare una cura, mentre Hulk, presto diventato verde, iniziò a comparire sempre più spesso, finendo nel mirino del generale Thaddeus \"Thunderbolt\" Ross e delle autorità. Da allora, Banner vive combattuto tra la sua natura di brillante scienziato e quella dell\'incontenibile Hulk.','2026-07-07 17:19:14','2026-07-15 09:49:05'),(22,'THOR','characters/cp6yqmVoGs6sDFScfPNxCgJ5ybUzs1KF8nSHRruI.jpg','characters-banner/1EY8knaiH42ZTSHOlXAUNFfxRmYrX6mla5DEZlVH.jpg','Thor, figlio di Odin, re degli dèi di Asgard, e della dea della Terra Gaea, crebbe ad Asgard preparandosi a diventare il futuro sovrano del regno. Fin da giovane affrontò missioni pericolose che gli permisero di dimostrare il proprio valore e di impugnare il leggendario martello Mjolnir, simbolo del suo potere come Dio del Tuono.\r\nNel corso dei secoli visse numerose avventure, combattendo eroi e mostri leggendari e trascorrendo anche lunghi periodi sulla Terra. A causa del suo carattere arrogante e della sua sete di battaglia, Thor provocò una guerra con i Giganti di Ghiaccio. Per insegnargli l\'umiltà, Odin lo esiliò sulla Terra privandolo dei suoi ricordi e trasformandolo nel medico umano Donald Blake.\r\nDurante il suo esilio, Blake ritrovò Mjolnir e, colpendolo contro una roccia, recuperò i suoi poteri e la sua vera identità di Thor. Tornato a essere il Dio del Tuono, continuò a difendere sia Asgard che la Terra dalle minacce più pericolose.\r\nQuando il fratellastro adottivo Loki iniziò a seminare caos sulla Terra, Thor si unì a Iron Man, Hulk, Ant-Man e Wasp per fondare gli Avengers. Da allora è diventato uno dei loro leader più importanti, celebre per la sua forza straordinaria, il suo coraggio e le sue eccezionali capacità in battaglia.','2026-07-07 17:32:06','2026-07-15 09:49:51');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comics`
--

DROP TABLE IF EXISTS `comics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `cover_img` text NOT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT 0,
  `is_preorder` tinyint(1) NOT NULL DEFAULT 0,
  `discount` tinyint(3) unsigned DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `brand_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comics_brand_id_foreign` (`brand_id`),
  CONSTRAINT `comics_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comics`
--

LOCK TABLES `comics` WRITE;
/*!40000 ALTER TABLE `comics` DISABLE KEYS */;
INSERT INTO `comics` VALUES (1,'THE FLASH VOL. 1: STRANGE ATTRACTOR','comics/flash-v1-cover-a.avif','Wally West non è mai stato così veloce, così realizzato, così eroico. Eppure... qualcosa non torna. Qualcosa di molto strano. La sua crescente comprensione dei propri poteri ha aperto a Wally nuove possibilità di avventure fantascientifiche e ha affinato i suoi sensi verso idee misteriose e sconosciute. Quando qualcosa sussurra dalle oscure vibrazioni oltre la Forza della Velocità, Wally dovrà sperimentare nuovi e creativi approcci ai suoi poteri mentre si troverà ad affrontare nuovi mondi, alleati enigmatici e terrori capaci di sconvolgere la mente! Inoltre, in Titans: Beast World Tour: Central City, sia Central City che Keystone City vengono colpite da spore mostruose, e tutta la Famiglia Flash dovrà scendere in campo! Flash Vol. 1: Lo Strano Attrattore segna l\'inizio di una nuova era realizzata dal team composto dallo sceneggiatore Simon Spurrier (Coda, Damn Them All) e dall\'artista Mike Deodato Jr. (Avengers, Not All Robots), con contributi aggiuntivi di autori e artisti legati alla Famiglia Flash, tra cui Alex Paknadel, A.L. Kaplan, Jarrett Williams e Serg Acuña. Contiene The Flash #1-6, Titans: Beast World Tour: Central City #1 e una storia tratta da The Flash #800.','the-flash-vol-1-strange-attractor',19.99,0,1,NULL,'2024-07-09',1,'2026-06-16 16:47:24','2026-07-13 07:47:33'),(2,'FLASH ROGUES: REVERSE-FLASH','comics/reverse-flash-1.avif','Salta sul Tapis Roulant Cosmico e scopri l\'origine mai raccontata di Flash Inverso! Chi è veramente? E quale rapporto ha con Barry Allen? Contiene The Flash #139, #197 e #283, The Flash #8 (2012), The Flash: Reverse Flash #23.2, Batman #21 e The Flash #25.','flash-rogues-reverse-flash',16.99,0,0,10,'2019-01-16',1,'2026-06-16 17:14:22','2026-07-13 07:58:44'),(3,'AQUAMAN #49','comics/aquaman-1.avif','La verità su come Aquaman abbia perso la memoria viene finalmente rivelata! Ma Arthur riuscirà ad affrontare la scioccante realtà? Chi sceglierà di sposare la Regina Mera? E come riuscirà Arthur a sfuggire alle fauci della terrificante Madre Squalo? Le maree del cambiamento stanno arrivando e tutto porterà allo storico AQUAMAN #50 del prossimo mese!','aquaman-49',3.99,0,1,NULL,'2019-06-19',1,'2026-06-16 17:17:09','2026-07-13 07:47:43'),(6,'THE AMAZING SPIDER-MAN (2018) #31','comics/W181W53OGQKPPzRMLFqIDHPKgd1TxsBG7A9r9HfD.jpg','**COLLEGAMENTO AD ABSOLUTE CARNAGE!** Tutti coloro che hanno indossato il simbionte di Carnage possiedono un **Codex**, compreso **Norman Osborn** dai tempi in cui era il **Red Goblin**! Riuscirà **Spider-Man** a salvare Norman da Carnage? E soprattutto... ne ha davvero voglia? **QUALI ALTRE SORPRESE SI NASCONDONO QUI?** Tantissime!','the-amazing-spider-man-2018-31',4.50,0,0,15,'2019-10-09',2,'2026-06-17 10:14:11','2026-07-13 16:50:47'),(7,'THE AMAZING SPIDER-MAN (2018) #16.1','comics/AAPWixlyCmZ51nShF6OMULzWTjVimmF2b2lTdjho.jpg','**COLLEGAMENTO A \"HUNTED\"!** La fortuna di **Black Cat** è in netta ripresa. È uscita indenne dallo scontro con la **Gilda dei Ladri**, i suoi rapporti con **Spider-Man** sono ormai quasi del tutto ricuciti e il mondo sembra ai suoi piedi. Ma il lavoro che ha appena accettato è destinato a cambiare tutto...','the-amazing-spider-man-2018-16-1',5.90,0,0,NULL,'2019-03-06',2,'2026-06-17 10:17:35','2026-07-09 11:13:17'),(11,'FLASHPOINT: THE WORLD OF FLASHPOINT FEATURING THE FLASH','comics/Y9aNXHCwge75ed04gkTqVog127UzZWZ0FjSRcc3g.avif','Non perdere questo volume di **Flash**, che raccoglie **Grodd of War #1**, **Kid Flash Lost #1-3**, **Legion of Doom #1-3**, **Reverse Flash #1** e **Citizen Cold #1-3**.\r\nNon è un sogno, non è una storia immaginaria, non è un racconto di un universo alternativo. Questa è la realtà dei fatti per Flash: quando **Barry Allen** si risveglia alla sua scrivania, scopre che il mondo è cambiato. La sua famiglia è viva, le persone che ama sono diventate estranee e gli amici più cari sono diversi, scomparsi o persino peggiori di prima.\r\nÈ un mondo sull\'orlo di una guerra catastrofica. Ma dove sono i più grandi eroi della Terra quando servono per fermarla?','flashpoint-the-world-of-flashpoint-featuring-the-flash',17.99,0,0,20,'2012-03-21',1,'2026-06-19 08:09:29','2026-07-14 10:50:03'),(12,'WOLVERINE (2024) #14','comics/YJx1PRrYFT41OvGTHVt0q8uqXI8pOYUUHbrKTELT.jpg','**Wolverine incontra Silver Sable!**\r\nLa serie principale torna con una nuova avventura in cui **Wolverine** incrocia il cammino di **Silver Sable** durante una missione per salvare un gruppo di **Morlock**. Ma sono davvero dalla stessa parte? E chi è che sta tenendo **Logan** nel mirino?\r\nUna nuova era ha inizio adesso!','wolverine-2024-14',11.90,1,1,NULL,'2026-01-07',2,'2026-06-19 13:00:23','2026-07-14 10:52:31'),(13,'ACTION COMICS PRESENTS: DOOMSDAY SPECIAL #1','comics/JGCQ6nnARNRrkc799IG79Ui7RcSYgR5uTA6Givkk.avif','È una creatura al di là della ragione, l’unica forza nell’universo abbastanza potente da uccidere Superman. È Doomsday, l’incarnazione vivente della morte, della distruzione e dell’evoluzione!\r\nSulla scia di Dark Crisis e Lazarus Planet, il Re Doomsday ora siede su un trono di teschi, oltre un fiume di sangue, governando sui demoni che infestano le profondità dell’Inferno… e potrebbe aver appena trovato un modo per tornare nel mondo dei vivi.\r\nOra spetta a Supergirl e Martian Manhunter fermare la bestia e assicurarsi che non ritorni mai più sul nostro piano terreno, anche se per riuscirci dovranno morire!\r\nIn più: il ritorno di Bloodwynd, il debutto dei Doomhounds e un indizio sul prossimo grande evento di Superman!','action-comics-presents-doomsday-special-1',5.99,0,0,5,'2023-08-29',1,'2026-06-19 13:04:04','2026-07-14 10:50:27'),(14,'CAPTAIN AMERICA: STEVE ROGERS (2016) #15','comics/s7ZAKvZi2QF27EJQkfNqSWVC6reQJHMh08JudJZQ.jpg','Soltanto un uomo può guidare l’Hydra verso una nuova era di dominio e superiorità! Il Teschio Rosso crede di essere quell’uomo!\r\nMa Captain America la pensa diversamente…\r\nÈ lo scontro finale senza esclusione di colpi che non riuscirete a credere!','captain-america-steve-rogers-2016-15',15.99,0,0,25,'2017-04-05',2,'2026-06-19 13:10:55','2026-07-14 10:53:14'),(15,'ABSOLUTE BATMAN #4','comics/JL0lDfhfwRCalIp98lyW1NlhPl8ChFbEsPRhGNWZ.avif','Absolute Batman si è affermato come una forza gigantesca con cui fare i conti. Ma come è arrivato a questo punto? Come ha spinto sé stesso oltre ogni limite? E in che modo gli eventi tragici della sua infanzia e i consigli di suo padre hanno plasmato l’uomo che è diventato… letteralmente?\r\nL’artista ospite Gabriel Walta si unisce al team creativo per questo fondamentale numero sulle origini di Absolute Batman, esplorando il passato di Bruce Wayne e il suo inevitabile futuro, destinato a diventare ancora più grande.\r\nNon perdetevi questo albo cruciale!','absolute-batman-4',4.99,0,0,NULL,'2025-01-08',1,'2026-06-19 13:19:45','2026-07-14 10:50:50'),(16,'BATMAN #156','comics/a50vMJbupMRgxaslIG3w4Xr8PGMF4UM2yxMHBXyg.avif','Il GCPD sta stringendo il cerchio sul presunto assassino… e su Batman!\r\nLa Wayne Enterprises è sotto attacco mentre i piani di Edward Nygma iniziano a rivelarsi.\r\nI Gufi non sono ciò che sembrano.\r\nNon perdetevi il penultimo, emozionante capitolo di **“The Dying City”**.','batman-156',4.99,0,0,NULL,'2025-01-01',1,'2026-06-19 13:20:47','2026-07-14 10:51:19'),(18,'ABSOLUTE FLASH (2025-) #16','comics/dBMc6CqVUoQqjG1ks0cAeK9WNDzJYViSu0jIYNcx.avif','Mentre Wally West corre alla ricerca delle risposte sui misteriosi fondatori dei S.T.A.R. Labs, i Rogues sono tornati in scena con una nuova missione: mettere al sicuro Gorilla Grodd e suo padre prima che conquistino il Colorado!','absolute-flash-2025-16',4.99,0,0,NULL,'2026-06-16',1,'2026-06-19 13:26:56','2026-07-09 11:14:37'),(19,'INVINCIBLE IRON MAN (2022) #16','comics/JQagESUhuQsrcXGpn3PLUW3QxofSz17benBF3EDz.jpg','Il giorno della resa dei conti è arrivato e c’è sicuramente uno scontro principale: Iron Man contro Feilong!\r\nPreparatevi al più grande scontro tra armature che abbiate mai visto!\r\nIn più: Tony Stark ottiene nuove armature!','invincible-iron-man-2022-16',10.99,1,1,NULL,'2024-03-20',2,'2026-06-19 13:29:29','2026-07-14 10:53:35'),(20,'RADIOACTIVE SPIDER-MAN (2025) #3','comics/AS8cG0FPQpAGcxY8v6aaOTxlN26RPeip8d84hbX1.jpg','Dieci anni dopo, quando la situazione si fa davvero estrema, con un mondo devastato da un gene mutante, infestato da mostri e ridotto a una landa post-apocalittica, verso chi ha una responsabilità maggiore uno Spider-Man RADIOATTIVO: verso gli abitanti di New York o verso le persone che ama di più al mondo?!\r\nGli ex Spider-Man, Miles Morales e Ghost-Spider conoscono la risposta… e per fare la cosa giusta dovranno passare attraverso Peter Parker!','radioactive-spider-man-2025-3',15.99,0,0,NULL,'2025-12-17',2,'2026-06-19 13:36:25','2026-07-14 10:53:51'),(21,'MILES MORALES: SPIDER-MAN (2022) #14','comics/K6n7g0kLcdQDG08EU17iCNtzoxogzldTsH17bJxv.jpg','**IL PROWLER ENTRA IN CAMPO!**\r\nHobgoblin lancia il suo primo attacco nella **Gang War**, senza concedere alcuna tregua a Spider-Man!\r\nE il Prowler si unisce alla battaglia… ma è un amico o un nemico?!','miles-morales-spider-man-2022-14',7.99,0,0,NULL,'2023-12-27',2,'2026-06-19 13:39:39','2026-07-14 10:54:20'),(22,'SUPERMAN/BATMAN VOL. 7','comics/3xXZg5qQlx3QdNhLWHRbdHuuwjuWSUPq6bE0NodP.avif','In queste epiche storie di squadra, l’Uomo d’Acciaio si ritrova a combattere fianco a fianco con uno strano Batman contro un’orda di Solomon Grundy.\r\nE cosa sta facendo il Sole ai suoi poteri?\r\nBatman, Doctor Occult, Detective Chimp e Klarion the Witch Boy devono affrontare un Armageddon magico nel presente, mentre Superman viene portato a incontrare la futura Justice League nella Hall of Doom!\r\nCome hanno fatto le cose ad andare così male… e c’è ancora qualcosa che si possa fare per fermare tutto?\r\nRaccoglie **Superman/Batman #76-87** e **Superman/Batman Annual #5**.','superman-batman-vol-7',29.99,0,0,NULL,'2019-02-20',1,'2026-06-19 13:44:19','2026-07-14 10:51:46'),(23,'BATMAN #65','comics/iNFBiS0wcC2lfiBn0IMJJOR7x5Dv9yYmdOVE5xu0.avif','**“THE PRICE”**\r\n\r\nI due più grandi detective dell’Universo DC affrontano il caso irrisolto che li farà a pezzi!\r\nIn qualità di principale architetto del programma Sanctuary, che ha avuto un costo enorme per molte persone, soprattutto per Wally West, Batman dovrà rispondere delle sue azioni… davanti a The Flash!\r\nUn vecchio caso del passato della Justice League è misteriosamente tornato alla luce, e Batman e Flash, gli unici due eroi in grado di risolverlo, sono ormai ai ferri corti!\r\nI nostri eroi dovranno affrontare un demone del passato, mentre cercano di seppellire i propri demoni interiori nel frattempo… e né il più grande detective del mondo né l’uomo più veloce in vita saranno mai più gli stessi.\r\nMa chi sta davvero muovendo i fili? E quale ruolo ha Gotham Girl in tutta questa storia?\r\nLe amicizie verranno messe alla prova e il sangue verrà versato in questo titanico evento crossover…','batman-65',3.99,0,0,NULL,'2019-02-20',1,'2026-06-19 13:45:23','2026-07-14 10:48:50'),(24,'SUPERIOR SPIDER-MAN (2013) #19','comics/aekrYsCrRT0aIEoOz7YueLAbk1FzfXYc7r38ghd1.jpg','**“NECESSARY EVIL” GIUNGE ALLA CONCLUSIONE!**\r\nIl momento che cambierà il mondo di Spider-Man e l’Universo Marvel per gli anni a venire.\r\nQuale Spider-Man è responsabile di tutto questo? Spider-Man 2099 o il Superior Spider-Man?\r\nGrandi sviluppi per il cast di entrambi gli Spider-Man… e per il futuro.','superior-spider-man-2013-19',13.99,0,0,NULL,'2013-10-16',2,'2026-06-19 13:53:07','2026-07-14 10:54:40'),(25,'SPIDER-MAN & WOLVERINE (2025) #7','comics/f6iSdvSbtkH6ORB1bkFhvM1ZbuqMme1j2r9mZyS7.jpg','**UNA STORIA DI DUE EROI!**\r\n\r\nDue eroi diversi, metodi completamente opposti e una sola missione che soltanto loro possono affrontare insieme.\r\nMa perché proprio Peter Parker e Wolverine?\r\nNon perdetevi l’inizio della più sorprendente avventura di Wolverine e Spider-Man di sempre!\r\n**IN PIÙ:** il debutto di un **NUOVO VILLAIN** che ha un legame con Peter e Logan molto più profondo di quanto possiate immaginare!','spider-man-wolverine-2025-7',6.99,0,0,NULL,'2025-11-12',2,'2026-06-19 13:57:47','2026-07-14 10:55:02'),(26,'CAPTAIN AMERICA (2025) #7','comics/HrzCWPsPkNu5rdEOjmfO8FMw7uEbe4Pza5zzy8cH.jpg','**UNA CROCIATA DEL CAPITANO!**\r\nLa paura di Red Hulk che dalle ceneri della Latveria possa sorgere un secondo Doctor Doom lo spinge a intraprendere azioni drastiche.\r\nNel frattempo, Captain America scopre che, all’interno del paese devastato dalla guerra, ci sono persone che vedono una strada verso un futuro migliore.\r\nRiuscirà Captain America a trasformare il loro sogno in realtà, oppure saranno troppe le forze schierate contro di lui?','captain-america-2025-7',5.99,0,0,NULL,'2026-02-18',2,'2026-06-19 13:59:38','2026-07-14 10:55:25'),(27,'MORTAL THOR (2025) #12','comics/ICrLhQkBYbR2LJNUzEhkOLWwuarTNkG4FxBgIFYn.jpg','**SEGRETI E BUGIE!**\r\n• Sigurd Jarlson possiede amore, amicizia e un\'anima umana. L\'uomo chiamato Blake non possiede nulla di tutto questo... ma ha l\'unica cosa che il suo nemico non ha.\r\n\r\n• Donald Blake sa esattamente chi è e cosa è... ed è pronto a rivelare tutto a Sigurd.\r\n\r\n• Da qualche parte nella città, un uomo con un martello sta scoprendo la verità...','mortal-thor-2025-12',6.99,1,0,NULL,'2026-07-01',2,'2026-07-09 11:08:07','2026-07-14 11:10:12'),(29,'HULK: BLOOD HUNT (2024) #1','comics/q35v6h3d5WlNMCuXnOLbo8R8aOvTyqZV7KBXbcKv.jpg','COSA SI NASCONDE SOTTO!\r\nLa missione di Hulk e Banner per salvare l’anima di Charlie li porta attraverso la città del vecchio West di OLD TUCSON, una località con una popolazione di una sola persona… ma l’ultimo uomo rimasto in città ha una storia incredibile da raccontare.\r\nPrima che la notte finisca, Hulk e Banner scopriranno che a Old Tucson c’è molto più di quanto sembri e che sotto la sabbia del deserto si nasconde molto più di quanto entrambi avrebbero mai potuto immaginare.\r\nNon perderti questo capitolo da brividi dell’evento BLOOD HUNT!','hulk-blood-hunt-2024-1',9.99,1,1,NULL,'2024-07-10',2,'2026-07-11 12:25:34','2026-07-14 10:56:08'),(30,'GREEN ARROW #3 (2010)','comics/dekXb1EJ0433vDORF8qMwn1fFgEMi6QHsRs5NMzs.avif','Il potere di Brightest Day si manifesta mentre la morte cala sulla foresta di Green Arrow. L\'Arciere di Smeraldo è davvero degno di vivere nel sacro bosco? Chi si cela tra gli alberi? Sarà il suo assassino o colui che gli salverà la vita? La saga prosegue tra nuovi misteri e colpi di scena.','green-arrow-3-2010',7.99,1,0,NULL,'2010-08-25',1,'2026-07-13 15:55:24','2026-07-13 15:55:24');
/*!40000 ALTER TABLE `comics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_06_16_172647_create_brands_table',2),(5,'2026_06_16_173050_create_comics_table',2),(6,'2026_06_16_173923_create_characters_table',2),(7,'2026_06_16_174239_create_character_comic_table',2),(8,'2026_06_19_160618_create_personal_access_tokens_table',3),(9,'2026_06_23_152257_add_banner_to_characters_table',4),(10,'2026_07_09_125753_add_slug_to_comics_table',5),(12,'2026_07_11_131937_add_status_to_comics_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('k20HPiXv8laDO43uQ8HAiTs87ChdIaAX3YKkadCK',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQnczY3FtbjVRVG14QmxkU2p4d3owRTUxQ3RwYTFPQ2lKZmxOeERPSCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2NoYXJhY3RlcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1784116192);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Andrea','andry.romanista@yahoo.it',NULL,'$2y$12$ik46y3fhjKhGXEN.YWfHTetR9bkrKw17mNatQdO1mcNrLO8f1pTNS','FDVMWqLAwOoulF9BHv2zGdmjgQeY0mEhJwMqNF9wnOZ7FuAeSr2GnYsuCKTC','2026-06-16 15:17:37','2026-06-16 15:17:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-17 14:18:30
