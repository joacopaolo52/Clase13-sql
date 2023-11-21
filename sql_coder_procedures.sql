USE sql_coder;
 

 
 DROP PROCEDURE IF EXISTS SP_ENTREGA ;
 
DELIMITER $$

CREATE PROCEDURE SP_ENTREGA(
    IN P_COLUMN_NAME VARCHAR(50),
    IN P_ASC_DESC VARCHAR(4)
)
BEGIN
    IF P_ASC_DESC NOT IN ('ASC', 'DESC') THEN
        SELECT 'ERROR: Dirección de ordenamiento no válida' AS Resultado;
    ELSE
        IF P_ASC_DESC = 'ASC' THEN
            SELECT *
            FROM TEAMS
            ORDER BY P_COLUMN_NAME ASC;
        ELSEIF P_ASC_DESC = 'DESC' THEN
            SELECT *
            FROM TEAMS
            ORDER BY P_COLUMN_NAME DESC;
        END IF;
    END IF;
    
END$$

DELIMITER ;

CALL SP_ENTREGA ('TEAM_ID', 'ASC');


 
 
DROP FUNCTION IF EXISTS FN_ADD_PLAYERS;

DELIMITER $$
CREATE FUNCTION FN_ADD_PLAYERS  (    P_ID INT,
									 P_NAME VARCHAR(50),
									 P_LASTNAME VARCHAR(50),
                                     P_AGE INT ,
                                     P_POSITION VARCHAR(50) ,
                                     P_HEIGHT DECIMAL(3,2) )

RETURNS VARCHAR(250)

DETERMINISTIC

BEGIN

DECLARE P_ERROR VARCHAR(250);

IF P_ID IS NULL THEN 
				SET P_ERROR = CONCAT('ERROR : NO SE PUDO INSERTAR EL JUGADOR PORQUE EL ID:', P_ID, 'SE REPITE O NO TIENE VALOR' );
                RETURN P_ERROR;
        ELSE 
        
			 INSERT INTO PLAYERS ( player_id , player_name, player_lastname , player_age, player_position, height  )
             values ( P_ID , P_NAME, P_LASTNAME , P_AGE, P_POSITION, P_HEIGHT  );
			 
			  select player_id, player_name, player_lastname, player_age, player_position, height
			   INTO P_ID , P_NAME, P_LASTNAME , P_AGE, P_POSITION, P_HEIGHT
			  from PLAYERS
			  ORDER BY P_ID DESC
			   LIMIT 1
			;
			
       END IF ;

RETURN P_ERROR;

END$$ 
DELIMITER ;



SELECT * FROM PLAYERS;


DROP PROCEDURE IF EXISTS SP_ADD_PLAYERS ;
DELIMITER //
CREATE PROCEDURE SP_ADD_PLAYERS (   INOUT P_ID INT,
									INOUT P_NAME VARCHAR(50),
									INOUT P_LASTNAME VARCHAR(50),
                                    INOUT P_AGE INT ,
                                    INOUT P_POSITION VARCHAR(50) ,
                                    INOUT P_HEIGHT DECIMAL(3,2) ,
									OUT P_ERROR VARCHAR(250) ) 
                                    
                                    
	BEGIN

         SELECT FN_ADD_PLAYERS ( P_ID, P_NAME, P_LASTNAME, P_AGE, P_POSITION, P_HEIGHT) INTO P_ERROR ;

	END//
DELIMITER ;

SET  @P_ID = 102 ;
SET  @P_NAME = 'Robert' ;
SET  @P_LASTNAME = 'Greenwood' ;
SET  @P_AGE = 23 ;
SET  @P_POSITION = 'Midfielder' ;
SET  @P_HEIGHT = 1.78 ;



CALL SP_ADD_PLAYERS ( @P_ID ,@P_NAME , @P_LASTNAME, @P_AGE, @P_POSITION, @P_HEIGHT, @P_ERROR);

SELECT @P_ID ,@P_NAME , @P_LASTNAME, @P_AGE, @P_POSITION, @P_HEIGHT, @P_ERROR;

SELECT * FROM PLAYERS






 