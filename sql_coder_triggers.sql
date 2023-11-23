USE SQL_CODER;

DROP TABLE IF EXISTS LOG_INSERT_PLAYERS;

CREATE TABLE IF NOT EXISTS LOG_INSERT_PLAYERS
(
ID_LOG INT AUTO_INCREMENT ,
ACTION_LOG VARCHAR(500) , -- DESCRIPCION DELA ACCION.
ACTION_NAME VARCHAR(10) , -- TIPO DE ACCION REALIZADA.
USER_LOG VARCHAR(100) , -- USUARIO QUE REALIZÓ LA ACCIÓN.
DATE_LOG DATE, -- FECHA QUE SE REALIZÓ LA ACCIÓN.
TIME_LOG TIME, -- HORARIO QUE SE REALIZÓ LA ACCIÓN.
PRIMARY KEY (ID_LOG)
);

DROP TABLE IF EXISTS LOG_UPDATE_TEAMS;

CREATE TABLE IF NOT EXISTS LOG_UPDATE_TEAMS
(
ID_LOG INT AUTO_INCREMENT ,
ACTION_LOG VARCHAR(500) ,
ACTION_NAME VARCHAR(10) ,
USER_LOG VARCHAR(100) ,
DATE_LOG DATE,
TIME_LOG TIME,
PRIMARY KEY (ID_LOG)
);






DROP TRIGGER IF EXISTS INSERT_PLAYER;

DELIMITER //
CREATE TRIGGER INSERT_PLAYER AFTER INSERT ON PLAYERS
FOR EACH ROW
BEGIN
INSERT INTO LOG_INSERT_PLAYERS (ACTION_LOG, ACTION_NAME, USER_LOG, DATE_LOG, TIME_LOG) VALUES
(
CONCAT('SE INSERTO UN NUEVO JUGADOR CON EL NOMBRE: ', NEW.PLAYER_NAME, ' ', NEW.PLAYER_LASTNAME),
'INSERT',
USER(),
LOCALTIMESTAMP(),
CURRENT_TIME()
);
END//
DELIMITER ;

INSERT INTO PLAYERS (PLAYER_ID, PLAYER_NAME, PLAYER_LASTNAME, BIRTHDATE, PLAYER_AGE, PLAYER_POSITION, HEIGHT)
VALUES ( 220, 'Alex', 'Johnson', '1998-05-15', 24, 'Defender', 1.98);

SELECT * FROM PLAYERS;
SELECT * FROM LOG_INSERT_PLAYERS;




DROP TRIGGER IF EXISTS UPDATE_TEAMS;

DELIMITER //
CREATE TRIGGER UPDATE_TEAMS BEFORE UPDATE ON TEAMS
FOR EACH ROW
BEGIN
INSERT INTO LOG_UPDATE_TEAMS (ACTION_LOG, ACTION_NAME, USER_LOG, DATE_LOG, TIME_LOG) VALUES
(
CONCAT('SE ACTUALIZÓ UN EQUIPO CON EL NOMBRE: ', NEW.TEAM_NAME, ', NOMBRE ANTERIOR: ', OLD.TEAM_NAME),
'UPDATE',
USER(),
LOCALTIMESTAMP(),
CURRENT_TIME()
);
END//
DELIMITER ;


UPDATE TEAMS
SET TEAM_NAME = 'RIVER PLATE', COUNTRY_TOURNAMENT_ID = 8 , CONTINENTAL_TOURNAMENT_ID = 2
WHERE TEAM_ID = 7;


SELECT * FROM TEAMS;
SELECT * FROM LOG_UPDATE_TEAMS;