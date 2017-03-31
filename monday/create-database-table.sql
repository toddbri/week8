create table restaurant (
  name varchar,
  distance real,
  stars integer,
  id serial PRIMARY KEY,
  category varchar,
  favorite_dish varchar,
  does_takeout boolean,
  last_meal date
);



insert into restaurant values ('Frankie''s',8,4,default,'Italian','Meat-lover''s Stromboli',TRUE,'3/23/2017');
insert into restaurant values ('Willy''s',8,3,default,'Mexican','Nachos',TRUE,'3/22/2017');



select * from restaurant order by distance;

select * from restaurant order by distance limit 2;

select * from restaurant order by stars desc limit 2;

select * from restaurant where distance < 8.1 order by stars desc limit 2;

select category, avg(stars) from restaurant group by category;

select max(stars) from restaurant group by category limit 1;
