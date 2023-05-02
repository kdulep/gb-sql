DROP SCHEMA IF EXISTS hw6;
CREATE SCHEMA IF NOT EXISTS hw6;
USE hw6;


/* Создайте функцию, которая принимает количество секунд и форматирует их в количество дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds' */

DROP  PROCEDURE IF EXISTS time_to;

DELIMITER //
CREATE PROCEDURE time_to(seconds INT)
BEGIN

DECLARE days INT default 0;
DECLARE hours INT default 0;
DECLARE minutes INT default 0;
DECLARE secs INT default 0;
    
    SET days=floor(seconds/86400);
    SET hours=floor((seconds-days*86400)/3600);
    SET minutes=floor((seconds-(hours*3600+days*86400))  / 60);
    SET secs=seconds-(days*86400+hours*3600+minutes*60);
    SELECT days, hours, minutes, secs, SEC_TO_TIME(seconds);

END //
DELIMITER ;

CALL time_to(123456);


/*Задача 2. Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10. */

delimiter |
CREATE FUNCTION generate_seq_stmt(n BIGINT UNSIGNED) RETURNS TEXT DETERMINISTIC
BEGIN
  DECLARE res TEXT DEFAULT 'SELECT 0 AS value';
  DECLARE i BIGINT UNSIGNED DEFAULT 1;
  WHILE i <=n DO
    SET res = CONCAT(res, ' UNION ALL SELECT ', i);
    SET i = i + 1;
  END WHILE;
  RETURN res;
END|
delimiter ;

SET @generated_stmt = CONCAT(CONCAT( "SELECT * FROM ( "),generate_seq_stmt(10), " ) AS U WHERE (U.value%2)=0;");
PREPARE stmt1 FROM @generated_stmt ;
SELECT @generated_stmt;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;
