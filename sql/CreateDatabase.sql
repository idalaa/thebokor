drop database if exists thebokor;
create database thebokor;
use thebokor;

# Anna oikeudet käyttäjälle markusep
# Komento luo samalla käyttäjän jos se puuttuu
grant all on thebokor.* to 'markusep'@'localhost' identified by 'juomalasi';

-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: thebokor
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `charactervisions`
--

DROP TABLE IF EXISTS `charactervisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charactervisions` (
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charactervisions`
--

LOCK TABLES `charactervisions` WRITE;
/*!40000 ALTER TABLE `charactervisions` DISABLE KEYS */;
INSERT INTO `charactervisions` VALUES (0);
/*!40000 ALTER TABLE `charactervisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passage`
--

DROP TABLE IF EXISTS `passage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passage` (
  `id` int(11) NOT NULL,
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `direction` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passage`
--

LOCK TABLES `passage` WRITE;
/*!40000 ALTER TABLE `passage` DISABLE KEYS */;
INSERT INTO `passage` VALUES (1,1,2,'west'),(2,1,3,'north'),(3,3,1,'south'),(4,2,1,'east'),(5,3,4,'north'),(6,4,3,'south'),(7,4,5,'east'),(8,5,4,'west'),(9,5,6,'east'),(10,6,5,'west'),(11,5,7,'south'),(12,7,9,'south'),(13,7,8,'east'),(14,7,9,'south'),(15,8,10,'north'),(16,9,10,'west'),(17,9,11,'north'),(18,11,12,'east'),(19,12,13,'north'),(20,12,14,'south'),(21,14,15,'east'),(22,15,14,'west'),(23,15,16,'south'),(24,16,15,'north'),(25,15,17,'east'),(26,17,18,'north'),(27,18,19,'north'),(28,18,20,'east'),(29,20,21,'north'),(30,21,20,'south'),(31,21,22,'north'),(32,20,23,'south'),(33,23,24,'north');
/*!40000 ALTER TABLE `passage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'------CHAPTER 1------After a while of wandering in the mold written walls fighting your way past dead insects, you find a hole in the wall. From the hole you can see a human making food at the stove and a cat laying on the kitchen table.'),(2,'You decide to not go in the open kitchen, but to keep trying to find a better place to get close to the cat. As you keep moving you step on a old rusty mouse trap, it doesn’t go off but it scares you enough to decide to turn back and enter the kitchen through the hole.'),(3,'You move to a close by chair. The cat wakes up from its sleep and starts to smell the air, he knows you  are here now. The human does not notice you, he is busy singing and dancing while stirring the food, you hear the lyrics “I just died in your arms tonight”.'),(4,'You move to a chair that is closer to the human, you notice some cheese on the ground it tastes like heaven! But you are still too far away from the cat. You cannot get closer from here without the human noticing you.'),(5,'You find a really small ladder which looks like its made for rats, how convenient. You have a clear vision of the cat now. The human still has not stopped dancing, you hear a huge tear in his voice as he tries to sing: and I will always love YOUUUUU'),(6,'You go east and notice another rat size ladder leading to odd shaped hole in the wall. As you enter the hole a bright green light turns on and a mirror shows the image of your body. You hear your body talking with a voice, which is not yours. You know you have heard it before.(Find more visions if you want to know who stole your body)'),(7,'You quickly decided to dodge the cat. The cat misses you by inches, charging a container of flour head on and before it understands what happened, you cast the spell.'),(8,'In the nick of time you have, you decide the best option is to charge the cat head on. Even if its 10 times bigger and has extremely sharp claws. This was not a good idea the cat bites your head off with one bite. The human notices, pets the cat and then adds you to the soup.'),(9,'------CHAPTER 2------You feel great. You can feel the healthiness of the cat now pumping through your veins. Maybe being a cat for the rest of your life wouldn’t be that bad. But then quickly realise the downsides, like having to wash 2 pairs of socks for one use. The human got really mad about you for charging the flour and threw you on the street.'),(10,'You decide the best course of plan now is run in the middle of the road on rush hour. You were wrong. As you enter the road, a bus hits you instantly killing you.'),(11,'As you walk the pavement you notice a wide open door to a meat store, you decide to enter it. The smell of the store is out of this world, freshly cooked meats of all kinds.'),(12,'You go behind the counter and hide from the owner who is ranting about why cat meat isn\'t popular, it tastes like chicken and is cheap! But you find half of a meatball on the ground and its absolutely amazing.'),(13,'You go north to the deep freezer, you enter it and the door slams shut behind you. There is no way out, but you do find a plate of meatballs. Guess the owner did get a special item on the menu after all.'),(14,'You go to the back door, next to it is a batch of meatballs straight from the oven, you manage to eat a couple before the owner notices and charges towards you yelling and cursing. You arrive to the docks and decide the best way to lose the owner is to enter a ship that is just leaving.'),(15,'The crew notices the hitchhiker that joined their cruise. They are happy to have a cat to accompany them. For a while you let them pet you and it feels great, they even feed you some beef jerky.'),(16,'You arrive to the ships only toilet for a crew of 50. The smell is too horrible to even describe. You fall in a trance, the toilet bowl water shows you a vision of yourself. You see your body watching an album of photos of a party a while back and tearing all pictures of with certain girl, what does it mean?'),(17,'You find your way to the captains room, there is a lot of rum here and posters of naked men on the wall. As your eyes were locked on the posters, you hear a voice repeating “ Why is the rum gone”. You walk behind the curtain where the sound is coming from, its a parrot! You cast the spell and take the parrots body.'),(18,'------CHAPTER 3------You feel great flying it’s as awesome as you thought it would be, but it sure is an exercise. You arrive to your hut and see smoke coming out of the chimney, so you know that the thief is home. You start thinking to yourself what kind of sick person would  cast this curse.'),(19,'You enter the chimn…. WHY WOULD YOU ENTER FROM HERE I JUST TOLD YOU THERE WAS SMOKE COMING FROM THE CHIMNEY YOU BURN AND DIE A SLOW AGONIZING DEATH'),(20,'A nice big window, you fly in without your body noticing you. You see the back of\nyourself and you can almost touch yourself.'),(21,'You fly on the table, you notice some crackers on the table and cannot resist them. As you crunch the crackers your body starts to turn, you need to hide!'),(22,'You panicked and had no where else to hide so you flew in the chimney, YOU BURN AND DIE A SLOW AGONIZING DEATH.'),(23,'You fly from the window to the top of a lamp, you are in distance to now sneakily assault and take back your body. Your journey is about to end.'),(24,'You assault your body and cast the spell, you won the game!!'),(25,' ');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visions`
--

DROP TABLE IF EXISTS `visions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visions` (
  `roomid` int(11) NOT NULL,
  `visionsid` int(11) NOT NULL,
  PRIMARY KEY (`visionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visions`
--

LOCK TABLES `visions` WRITE;
/*!40000 ALTER TABLE `visions` DISABLE KEYS */;
INSERT INTO `visions` VALUES (6,1),(16,2);
/*!40000 ALTER TABLE `visions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-16 20:32:47
