CREATE DATABASE  IF NOT EXISTS `railways` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `railways`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: railways
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `calculate_age`
--

DROP TABLE IF EXISTS `calculate_age`;
/*!50001 DROP VIEW IF EXISTS `calculate_age`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `calculate_age` AS SELECT 
 1 AS `name`,
 1 AS `email_id`,
 1 AS `PNR`,
 1 AS `gender`,
 1 AS `Age`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `profit`
--

DROP TABLE IF EXISTS `profit`;
/*!50001 DROP VIEW IF EXISTS `profit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `profit` AS SELECT 
 1 AS `zone_name`,
 1 AS `total_Expense`,
 1 AS `total_Earnings`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `calculate_age`
--

/*!50001 DROP VIEW IF EXISTS `calculate_age`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `calculate_age` AS select concat(`p`.`first_name`,' ',`p`.`last_name`) AS `name`,`p`.`email_id` AS `email_id`,`t`.`PNR` AS `PNR`,`p`.`gender` AS `gender`,ceiling(((to_days(cast(now() as date)) - to_days(`p`.`dob`)) / 365)) AS `Age` from (`passenger_details` `p` join `ticket` `t`) where (`t`.`Passenger_id` = `p`.`Passenger_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `profit`
--

/*!50001 DROP VIEW IF EXISTS `profit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `profit` AS select `z`.`zone_name` AS `zone_name`,sum(`tr`.`repairs_cost`) AS `total_Expense`,sum(`tc`.`fare`) AS `total_Earnings` from (((`train_repairs` `tr` join `train_zone` `z`) join `ticket` `t`) join `train_class` `tc`) where ((`tr`.`repairs_zone_id` = `z`.`zone_id`) and (`tc`.`class_name` = `t`.`class_type`)) group by `z`.`zone_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'railways'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `logs` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `logs` ON SCHEDULE EVERY 1 MINUTE STARTS '2018-12-13 00:20:55' ON COMPLETION PRESERVE ENABLE DO BEGIN
	INSERT INTO `logs`(train_id,No_of_tickets_booked,log_time)
	SELECT train_id, COUNT(PNR),NOW() FROM ticket
	GROUP BY train_id;
 END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'railways'
--
/*!50003 DROP FUNCTION IF EXISTS `discount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `discount`(passenger_id INT) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE message varchar(50);
DECLARE age int;
SET age = (Select ceil(datediff(date(now()),p.dob)/365)from passenger_details p where p.passenger_id = passenger_id);
IF age > 25 < 35 THEN 
SET message = 'Eligible for student discount'; 
/*ELSE IF age > 35 THEN
SET message = 'Eligible for senior citizen discount';
ELSE */
SET message = 'No discount';
END IF;
RETURN message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `booking`(in train_id int,passenger_name varchar(50),in source_name varchar(50),in destination_name varchar(50), in class_id int)
BEGIN
START TRANSACTION;
SET @PNR = lpad(conv(floor(rand()*pow(36,6)),10,36),6,0);
SET @seat_no = lpad(conv(floor(rand()*pow(4,2)),10,4),2,0);
SET @passenger_id = (select distinct Passenger_id from passenger_details where concat_ws(' ',first_name,last_name) = passenger_name);
SET @source_id = (select distinct station_id from station where station_name = source_name );
SET @destination_id = (select distinct station_id from station where station_name = destination_name );
SET @class = (select distinct class_name from train_class where class_id = class_id );

			INSERT INTO ticket(
					PNR,
					source_station_id,
					destination_station_id,
					ticket_status,
					train_id,
					passenger_id,
					seat_number,
					class_type,
					added_on,
					added_by,
					modified_date,
					modified_by,
					is_active
					)
			VALUES(
					@PNR,
					@source_id,
					@destination_id,
					'Booked',
					train_id,
					@passenger_id,
					@seat_no,
                    @class,
					curdate(),
					1,
					curdate(),
					1,
					1
            );

UPDATE train_seat_details ts
SET ts.seat_booked = ts.seat_booked + 1 , ts.available_seat = ts.available_seat - 1
WHERE ts.train_id = train_id
limit 1;  
COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancellation_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancellation_detail`(in train_id int,in email_id varchar(30),in pnr varchar(20))
BEGIN
	INSERT INTO cancellations(
							train_id,
							email_id,
							PNR,
							date_cancelled,
							`status`
							)
	VALUES(   train_id
			,email_id
			,pnr
			,date(now())
			,'cancelled');
	UPDATE ticket t SET t.is_active = 0 WHERE t.PNR = @pnr;
	UPDATE train_seat_details ts
	SET ts.seat_booked = ts.seat_booked -1, ts.available_seat = ts.available_seat + 1
		WHERE ts.train_id = train_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `daily_status_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `daily_status_count`()
BEGIN
	SELECT 
		SUM(CASE WHEN status_id = 1 THEN 1 ELSE 0  END )AS Open,
		SUM(CASE WHEN status_id = 2 THEN 1 ELSE 0 END )AS 'Work In progress',
		SUM(CASE WHEN status_id = 3 THEN 1 ELSE 0  END )AS completed,
		SUM(CASE WHEN status_id = 4 THEN 1 ELSE 0  END )AS 'On hold',
		SUM(CASE WHEN status_id = 5 THEN 1 ELSE 0  END )AS Cancelled
	FROM repair_transaction WHERE added_date = date(now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_employee_supervisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_supervisor`(IN supervisor_id INT)
BEGIN
	START TRANSACTION;
		SELECT 
			emp.emp_id,
			concat(emp.first_name,' ',emp.last_name) AS Employee_Name,
			emp.department_id,
			d.department_name,
			emp.email_id,
			emp.mobile_no,
			emp.address,
			emp.city,
			emp.state,
			emp.gender,
			emp.dob,
			emp.supervisor_id,
			Concat_ws(' ',e.first_name,e.last_name) AS Supervisor_Name
		FROM employee emp
		INNER JOIN department d
		INNER JOIN employee e 
		WHERE 	d.department_id = emp.department_id AND
				e.emp_id= emp.supervisor_id AND
				emp.supervisor_id = supervisor_id;

	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_repair_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_repair_status`(IN repair_id INT)
BEGIN
	SELECT 
		rt.repair_id, 
		rt.status_id,
        re.`status`
    FROM repair_transaction rt
	INNER JOIN repair_status re  
	WHERE re.status_id =  rt.status_id AND
			repair_id = repair_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_ticket_PNR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ticket_PNR`(IN PNR varchar(20))
BEGIN
	START TRANSACTION;

		SELECT 
			t.PNR,
			t.passenger_id,
			CONCAT_WS(' ',p.first_name,p.last_name) AS Name,
			t.source_station_id,
			t.destination_station_id,
			s.station_name,
			t.source_station_id,
			s.station_name,
			t.train_id,
			tr.train_name,
			t.seat_number,
            t.class_type,
			t.ticket_status
	
	
		FROM ticket t
		INNER JOIN station s
		INNER JOIN train tr 
		INNER JOIN passenger_details p 
		WHERE t.passenger_id = p.passenger_id 
		AND tr.train_id = t.train_id
		AND s.station_id = t.source_station_id 
		AND s.station_id = t.destination_station_id 
		AND t.is_active = 1
		AND PNR = PNR;
	COMMIT; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_passenger_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_passenger_details`( 
		 in first_name varchar(50)
		,in last_name varchar(50)
		,in mobile_number varchar(20)
		,in email_id varchar(20)
		,in address varchar(50)
		,in city varchar(10)
		,in state varchar(10)
		,in dob date
		,in gender varchar(10)
        )
BEGIN	
	Start Transaction;
   
	SET @gender = CASE When gender = 'Male' then 'M' 
					   When gender = 'Female' then 'F'
						ELSE Null
				  END;
 
		/*Start transaction;*/
        
	Insert into `passenger_details`
	(
		`first_name`
		,`last_name`
		,`mobile_number`
		,`email_id`
		,`address`
		,`city`
		,`state`
		,`dob`
		,`gender`
	)
	values
	(
		 first_name
		,last_name
		,mobile_number
		,email_id
		,address
		,city
		,state
		,dob
		,@gender
	);
   /*commit;*/
   Commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `train_enquiry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `train_enquiry`(in source_station varchar(50),in destination varchar(50),in train_class varchar(20))
BEGIN
	/*Start transaction;*/
		Set @source_id = (Select station_id from station where station_name = source_station);
		Set @destination_id = (Select station_id from station where station_name = destination);
		SELECT 
			t.train_id,
			t.train_name,
			/*source_station,
			destination,*/
			ts.start_time,
            tc.class_name,
            tc.fare
		FROM train t
		INNER JOIN train_class_transaction tct 
        INNER JOIN train_class tc 
		INNER JOIN train_schedule ts
		WHERE 
			tct.train_id = t.train_id
		AND	ts.source_id = @source_id
		AND ts.destination = @destination_id
		AND tc.class_name = train_class
        AND tc.class_id = tct.train_class_id
        AND ts.train_id = t.train_id;
	/*commit;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_repair_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_repair_status`(IN supervisor_id INT,IN status_id INT, IN repair_id INT)
BEGIN
 
	UPDATE train_repairs rs
	SET rs.repair_status_id = status_id
	WHERE rs.supervisor_id = supervisor_id 
    AND rs.repairs_id = repair_id ;
    IF (Select found_rows() > 0)
    THEN
	INSERT INTO `repair_transaction`
		(`repair_id`,
		`status_id`,
		`added_date`,
		`added_by`,
		`modified_date`,
		`modified_by`,
		`is_active`)
	VALUES
		(repair_id,
		status_id,
		current_timestamp(),
		1,
		current_timestamp(),
		1,
		1);
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 11:39:11
