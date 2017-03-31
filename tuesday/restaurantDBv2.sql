-- \c "";
-- drop database if exists restaurantv2;
-- create database restaurantv2;
-- \c restaurantv2;

create table restaurant (
  id serial primary key,
  name varchar,
  address varchar,
  category varchar
);

create table reviewer (
  id serial primary key,
  name varchar,
  email varchar,
  karma integer check(karma > -1 and karma <8)
);

create table review (
  id serial primary key,
  reviewer integer REFERENCES reviewer (id),
  stars integer check(stars > -1 and stars < 6),
  review text,
  restaurant_id integer REFERENCES restaurant (id)
);
