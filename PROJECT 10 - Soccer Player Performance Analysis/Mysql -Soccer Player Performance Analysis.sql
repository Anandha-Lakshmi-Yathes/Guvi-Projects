create database Soccer_Player_Performance_Analysis;

use Soccer_Player_Performance_Analysis;

create table players(
	Name Varchar(100),
    Age int,
    nationality varchar(100),
    club varchar(255),
    overall int,
    potential int,
    `Value (€)` INT,
    `Wage (€)` INT,
    `preferred position` varchar(100),
    special int,
    acceleration int,
    agility int,
    dribbling int,
    `ball control` int,
    `finishing` int,
    `free kick accuracy` int,
    `short passing` int,
    `shot power`int,
    stamina int,
    strength int,
    `sprint power` int,
    jumping int,
    `heading accuracy` int,
    reactions int,
    `age group` varchar(50)
);

select distinct club from players;   

select * from players;
  
SELECT * FROM Players LIMIT 5;



 -- 01.Identify the Top Players by Overall Rating --
 select name , nationality ,club,overall, potential
 from players
 order by overall desc
 limit 10;
 
 -- 02. the Average Age of Players in Each Position --
select `preferred position`,Round(avg(age),2) As Avg_age
from players
group by `preferred position`
order by avg_age desc;

 -- 03. Market Value Distribution Among Different Nationalities --
select nationality, `age group`, count(*) as player_count, 
       round(avg(`value (€)`),2) as avg_market_value
from players
group by nationality, `age group`
order by avg_market_value desc;

 
 -- 04.Performance Metrics of Players by Club ---
 select club, avg(overall) as avg_overall , avg(potential) as avg_potential
 from players
 group by club
 order by avg_overall desc
 limit 10;
 
 -- 05.Find the Most Common Positions Played by Top-Performing Players --
select `preferred position`, count(*) as players_count
from players
where overall > 85
group by `preferred position`
order by players_count desc
limit 5;

select name, club, `preferred position`
from players
where `preferred position` like '% %'
order by name asc;

-- 06. Identify Players with the Highest Acceleration and Agility ,Dribling Ratings --
 select name, club, acceleration, agility, dribbling
from players
order by acceleration desc, agility desc, dribbling desc
limit 10;

 
 -- 07.Calculate the Average Wage for Players in Each League--
 create table league_mapping (
    club varchar(255) primary key,  
    league varchar(100)          
);

insert into league_mapping (club, league) values
('Real Madrid CF', 'La Liga'),
('FC Barcelona', 'La Liga'),
('Atlético Madrid', 'La Liga'),
('Manchester United', 'Premier League'),
('Manchester City', 'Premier League'),
('Chelsea', 'Premier League'),
('Arsenal', 'Premier League'),
('Liverpool', 'Premier League'),
('Tottenham Hotspur', 'Premier League'),
('Leicester City', 'Premier League'),
('West Ham United', 'Premier League'),
('Everton', 'Premier League'),
('FC Bayern Munich', 'Bundesliga'),
('Borussia Dortmund', 'Bundesliga'),
('RB Leipzig', 'Bundesliga'),
('Bayer 04 Leverkusen', 'Bundesliga'),
('Juventus', 'Serie A'),
('AC Milan', 'Serie A'),
('Inter Milan', 'Serie A'),
('Napoli', 'Serie A'),
('Roma', 'Serie A'),
('Paris Saint-Germain', 'Ligue 1'),
('AS Monaco', 'Ligue 1'),
('Olympique Lyonnais', 'Ligue 1'),
('Ajax', 'Eredivisie'),
('PSV Eindhoven', 'Eredivisie'),
('Feyenoord', 'Eredivisie'),
('FC Porto', 'Primeira Liga'),
('SL Benfica', 'Primeira Liga'),
('Sporting CP', 'Primeira Liga'),
('CSKA Moscow', 'Russian Premier League'),
('Zenit St. Petersburg', 'Russian Premier League'),
('Spartak Moscow', 'Russian Premier League');

select * from league_mapping;

insert ignore into league_mapping (club, league) values
('Sevilla FC', 'La Liga'),
('SD Eibar', 'La Liga'),
('Real Sociedad', 'La Liga'),
('Real Betis Balompié', 'La Liga'),
('RCD Espanyol', 'La Liga'),
('RC Deportivo de La Coruña', 'La Liga'),
('RC Celta de Vigo', 'La Liga'),
('Getafe CF', 'La Liga'),
('Deportivo Alavés', 'La Liga'),
('Crystal Palace', 'Premier League'),
('Newcastle United', 'Premier League'),
('Burnley', 'Premier League'),
('Brighton & Hove Albion', 'Premier League'),
('Bournemouth', 'Premier League'),
('FC Schalke 04', 'Bundesliga'),
('Borussia Mönchengladbach', 'Bundesliga'),
('Eintracht Frankfurt', 'Bundesliga'),
('FC Augsburg', 'Bundesliga'),
('Hannover 96', 'Bundesliga'),
('Hamburger SV', 'Bundesliga'),
('1. FC Köln', 'Bundesliga'),
('1. FSV Mainz 05', 'Bundesliga'),
('Sampdoria', 'Serie A'),
('Fiorentina', 'Serie A'),
('Bologna', 'Serie A'),
('Genoa', 'Serie A'),
('Chievo Verona', 'Serie A'),
('Torino', 'Serie A'),
('Atalanta', 'Serie A'),
('Lazio', 'Serie A'),
('Olympique de Marseille', 'Ligue 1'),
('OGC Nice', 'Ligue 1'),
('FC Nantes', 'Ligue 1'),
('Montpellier Hérault SC', 'Ligue 1'),
('Dijon FCO', 'Ligue 1'),
('Stade Rennais FC', 'Ligue 1'),
('SC Braga', 'Primeira Liga'),
('Galatasaray SK', 'Turkish Süper Lig'),
('Beşiktaş JK', 'Turkish Süper Lig'),
('Fenerbahçe SK', 'Turkish Süper Lig'),
('İstanbul Başakşehir FK', 'Turkish Süper Lig'),
('Trabzonspor', 'Turkish Süper Lig'),
('FC Porto', 'Primeira Liga'),
('SL Benfica', 'Primeira Liga'),
('Sporting CP', 'Primeira Liga'),
('Seattle Sounders FC', 'MLS'),
('Montreal Impact', 'MLS'),
('New York City Football Club', 'MLS'),
('Orlando City Soccer Club', 'MLS'),
('LA Galaxy', 'MLS'),
('Portland Timbers', 'MLS'),
('Columbus Crew SC', 'MLS'),
('Atlanta United FC', 'MLS'),
('Chicago Fire Soccer Club', 'MLS');

show tables;
 
 select club, round(avg(`Wage (€)`),2) as avg_wage
 from players
 group by  club
 order by avg_wage desc
 limit 10;
 
select lm.league, round(avg(p.`wage (€)`), 2) as avg_wage
from players p
join league_mapping lm on p.club = lm.club
group by lm.league
order by avg_wage desc;

-- 08.Determine Potential vs. Overall Rating for Young Talents--
select name, age,overall ,potential, (potential - overall) as growth_potential
from players
where age <=21
order by growth_potential desc
limit 10;

-- 09.players with the best value for money (high performance, low cost).(Market Value vs. Performance (ROI for scouting & transfers))--
select nationality, name, club, overall, potential, 
       `value (€)`, `wage (€)`, 
       ROUND((`value (€)` / overall), 2) AS value_per_overall, 
       ROUND((`value (€)` / `wage (€)`), 2) AS value_per_wage_ratio, 
       `age group`
FROM players
ORDER BY value_per_wage_ratio DESC
LIMIT 10;


-- 10.age group performance trends--
select `age group`, 
       round(avg(overall), 2) as avg_overall, 
       round(avg(potential), 2) as avg_potential
from players
group by `age group`
order by avg_overall desc;

-- 11.Identifying Transfer Risk Players --
select name, club, overall, potential, performance_score, `wage (€)`, `age group`
from (
    select name, club, overall, potential, 
           (overall + potential) as performance_score, `wage (€)`, `age group`
    from players
) as subquery
where performance_score < (select avg(overall) + avg(potential) from players) 
and `wage (€)` > (select avg(`wage (€)`) from players)  
order by `wage (€)` desc;

-- 12. correlation between acceleration & dribbling --
select 
    (avg(acceleration * dribbling) - (avg(acceleration) * avg(dribbling))) /
    (stddev(acceleration) * stddev(dribbling)) as correlation_acc_dribbling
from players;

-- 13. Calculate the Average Market Value of Players by Age Group--
select `age group`, round(avg(`value (€)`), 2) as avg_market_value
from players
group by `age group`
order by avg_market_value desc;

-- 14. Identify Players with the Best Free-Kick Accuracy --
select name, club, `free kick accuracy`
from players
order by `free kick accuracy` desc
limit 10;

-- 15. Create Visualizations for Player Statistics Comparisons by Club --
select club, round(avg(overall), 2) as avg_overall, round(avg(`wage (€)`), 2) as avg_wage
from players
group by club
order by avg_overall desc;

desc players;

select @@hostname as servername;