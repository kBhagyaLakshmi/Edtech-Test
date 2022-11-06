show databases;
create database master;
use master;
create table user(Userid int primary key, FirstName varchar(100), lastName varchar(100), age integer, salary integer);
create table movie(Userid int, movieName varchar(100), hero varchar(100), heroin varchar(100),ticketPrice integer, rating integer, foreign key(Userid) references user(Userid));
insert into user values(101, "Bhagya", "Lakshmi", 20, 30000);
insert into user values(102, "Rupa", "Devi",22,40000);
insert into user values(103,"Anu", "Radha",20,35000);
insert into movie values(101,"Pokiri","Mahesh babu","Iliyana",200,9);
insert into movie values(101,"Aathadu","Mahesh babu","Trisha",150,8);
insert into movie values(101,"Varsham","Prabhas","Trisha",180,8);
insert into movie values(101,"Jalsa","Pawan Kalyan","Iliyana",180,9);
insert into movie values(101,"kick","Ravi Teja", "Iliyana", 100,7);
insert into movie values(101,"saaho","Prabhas","Shradha",250,4);
insert into movie values(101,"Brahmotsavam","Mahesh babu","Samantha",200,4);
insert into movie values(101,"Spyder","Mahesh babu","Rakul", 180,3);
insert into movie values(101,"Teenmar","Pawan kalyan","Trisha",100,4);
insert into movie values(101,"Dammu","NTR","Trisha",150,3);
insert into movie values(102,"Nenu sailaja","Ram","Keerthi",120,7);
insert into movie values(102,"Godavari","Sumanth","Kamalni mukarjee",170,10);
insert into movie values(102,"Aagadu","Mahesh babu","Tamanna",100,3);
insert into movie values(103,"Aanand","Raja","Kamalni mukarjee",150,9);
insert into movie values(103,"RadheSyam","Prabhas","Pooja",200,4);
insert into movie values(103,"ps1","karthi","Trisha",250,7);
select * from user;
select *from movie;
select * from movie m, user u where m.UserId=u.UserId and u.FirstName="Bhagya";
select movieName, ticketPrice from movie m, user u where m.userId=u.userId and u.UserId=101 and m.ticketPrice>150;
select movieName, ticketPrice from movie m, user u where m.userId=u.userId and m.ticketPrice>150;
select movieName, rating from movie m, user u where m.userId=u.userId and m.rating<5;
select m.movieName, m.heroin, u.userId from movie m, user u where m.userId=u.userId group by heroin having count(heroin)>=2;
SELECT movieName, heroin
FROM movie m1 
WHERE (SELECT COUNT(heroin) FROM movie m2 ,user u  where u.userId=101 and u.userId=m1.userId and  m1.heroin=m2.heroin) >= 2;
select sum(ticketPrice) , avg(ticketPrice) from user u,movie m 
where u.userId=m.userId and u.FirstName="Bhagya";
