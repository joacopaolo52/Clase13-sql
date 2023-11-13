use sql_coder;


-- TABLA DE JUGADORES

create or replace view vw_players
as (
select * from players
);

select * from vw_players;


-- TABLA DE EQUIPOS

create or replace view vw_teams 
as (
select * from teams
);

select * from vw_teams;


-- TABLA DE PAISES

create or replace view vw_country
as (
select * from country
);

select * from vw_country;


-- NOMBRE Y APELLIDO DE JUGADORES

create or replace view vw_playersName
as (
select player_name, player_lastname from players
);

select * from vw_playersName;


-- JUGADORES DE BOCA JUNIORS (team_id = 6)

create or replace view vw_playersBoca 
as
(
select * from players where team_id = 6
);

select * from vw_playersBoca;

-- JUGADORES DE NACIONALIDAD RUSA (country_id = 20)

create or replace view vw_playersRusia
as
(
select * from players where country_id = 20
);

select * from vw_playersRusia;

-- JUGADORES QUE SU ALTURA ES MAS DE 1.85

create or replace view vw_playerHeight
as (
select player_id, player_name, player_lastname,  player_age, player_position, team_name, height
from players as P JOIN TEAMS as T
ON P.team_id = T.team_id
where P.height > 1.80
ORDER BY P.height DESC
);

select * from vw_playerHeight;

-- Mostrar jugadores donde su equipo pertenezca a la confederacion UEFA

create or replace view vw_playersUefa 
as
(
select player_name, player_lastname, team_name
from players as P JOIN teams as T
on P.team_id = T.team_id 
join continental_tournaments as C 
on C.continental_tournament_id = T.continental_tournament_id
where confederation_name = 'UEFA'
);


select * from vw_playersUefa;


-- VISTA DE PAISES DONDE SU CONFEDERACIÓN FORMA PARTE DEL CONTINENTE AMERICA


create or replace view vw_countryContinent
as
(
select country_name, confederation_name, continent_name
from country as C JOIN confederations as CF
on C.confederation_id = CF.confederation_id
join continents as CT
on CT.continent_id = CF.continent_id
where continent_name = 'America'
);

select * from vw_countryContinent;
