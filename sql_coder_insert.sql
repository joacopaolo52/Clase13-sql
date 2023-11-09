USE sql_coder;

INSERT INTO CONTINENTS (continent_id , continent_name)
VALUES 	(1 ,'America'),
		(2 , 'Europe'),
        (3 , 'Asia'),
        (4 , 'Africa'),
        (5 , 'Oceania'),
        (6 , 'Antarctica');
	
    
INSERT INTO CONFEDERATIONS (confederation_id , confederation_name, continent_id )
VALUES 	(1 ,' AFC ' , 3 ) , -- ASIA
		(2 ,' CAF ' , 4 ) ,  -- AFRICA
        (3 ,' CONCACAF ' , 1 ) ,  
        (4 ,' CONMEBOL ' , 1 ) , 
        (5 ,' OFC ' , 5 ) , -- OCEANIA
        (6 ,' UEFA ' , 2 ) ;
        
        
INSERT INTO COUNTRY
VALUES 	(1 ,' Brazil ' , 4 ) ,
		(2 ,' Germany ' , 6 ) ,
        (3 ,' Argentina ' , 4 ) ,
        (4 ,' Italy ' , 6 ) ,
        (5 ,' France ' , 6 ) ,
        (6 ,' Spain ' , 6 ),
        (7 ,' Netherlands Bajos ' , 6 ),
        (8 ,' Uruguay ' , 4 ),
        (9 ,' England ' , 6 ),
        (10,' Portugal ' , 6 ),
        (11,' Belgium ' , 6 ),
        (12,' Croatia ' , 6 ),
        (13,' Mexico ' , 3 ),
        (14,' Colombia ' , 4 ),
        (15,' Chile ' , 4 ),
        (16,' Nigeria ' , 2 ),
        (17,' Japan ' , 1 ),
        (18,' Australia ' , 5 ),
        (19,' Turkey ' , 6 ),
        (20,' Russia ' , 1 ),
        (21,' Ivory Coast ' , 2 ),
        (22,' Ghana ' , 2 ),
        (23,' Denmark ' , 6 ),
        (24,' United States ' , 3 ),
        (25,' South Korea ' , 1 );


INSERT INTO CONTINENTAL_TOURNAMENTS
VALUES 	(1 ,' CAF Champions League ' , 2 ) , 
		(2 ,' Copa Libertadores ' , 4 ) ,  
        (3 ,' AFC Champions League ' , 1 ) ,  
        (4 ,' Copa de Oro ' , 3 ) , 
        (5 ,' Copa Sudamericana ' , 4 ) , 
        (6 ,' Champions League ' , 6 ) ,
        (7 ,' Leagues Cup  ' , 3 ) ,
        (8 ,' Europa League ' , 6 ) ,
        (9 ,' Conference League ' , 6 ) ;
        
INSERT INTO country_tournaments		
VALUES 	(1 ,' Premier League ' , 2 ) , 
		(2 ,' LaLiga' , 6 ) ,  
        (3 ,' Serie A Brasil ' , 1 ) ,  
        (4 ,' Serie A ' , 4 ) , 
        (5 ,' Bundesliga ' , 2 ) , 
        (6 ,' Liga NOS ' , 10) ,
        (7 ,' Ligue 1  ' , 5 ) ,
        (8 ,' Primera División Argentina ' , 3 ) ,
        (9 ,' NPFL ' , 16) , -- Nigeria
        (10,' Liga BetPlay Dimayor ' , 14) ,
        (11,' Jupiler Pro League ' , 11) ,
        (12,' J1 League ' , 17) ;
        
        
        INSERT INTO TEAMS
VALUES 	(1 ,' Real Madrid  ' , 2, 6),
		(2 ,' Bayern Múnich' , 5, 6),
        (3 ,' Liverpool FC ' , 1, 6),
        (4 ,' PSG  ' , 7, 6),
        (5 ,' Benfica' , 6, 8),
        (6 ,' Boca Juniors ' , 8, 2),
        (7 ,' Borussia Mönchengladbach   ' , 5, 8),
        (8 ,' Roma ' , 4, 8),
        (9 ,' Santos ' , 3, 2),
        (10,' Independiente ' , 8, 5),
        (11,' Gamba Osaka ' , 12, 1),
        (12,' América de Cali ' , 10, 5);
        

        INSERT INTO VALUE
VALUES 	(1 ,' 18000000  ' , TRUE, 25000000, 100000,1),
		(2 ,' 20000000  ' , TRUE, 30000000, 120000,2),
        (3 ,' 15000000  ' , FALSE, NULL, 90000,3),
        (4 ,' 25000000  ' , TRUE, 30000000, 150000,4),
        (5 ,' 28000000  ' , FALSE, NULL, 160000,5),
        (7 ,' 24000000  ' , TRUE, 40000000, 150000,7),
        (8 ,' 30000000  ' , FALSE, NULL, 1,8),
        (9 ,' 32000000  ' , TRUE, 25000000, 130000,9),
        (10,' 27000000  ' , TRUE, 28000000, 160000,10),
        (11,' 23000000  ' , FALSE, NULL, 170000,11),
        (12,' 26000000  ' , TRUE, 35000000, 150000,12),
        (13,' 29000000  ' , TRUE, 42000000, 180000,13),
        (14,' 20000000  ' , TRUE, 17000000, 110000,14),
        (15,' 25000000  ' , TRUE, 31000000, 130000,15);
    
	
