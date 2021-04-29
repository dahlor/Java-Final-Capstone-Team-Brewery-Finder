drop table if exists userbreweries cascade;
drop table if exists userbrewerydetails cascade;
drop table if exists beers cascade;
drop table if exists reviews cascade;

CREATE TABLE userbreweries
(
obdb_id character varying(255) primary key unique,
name character varying(255),
brewery_type character varying(255),
street character varying(255),
address_2 character varying(255),
address_3 character varying(255),
city character varying(255),
state character varying(255),
county_province character varying(255),
postal_code character varying(255),
website_url character varying(255),
phone character varying(12),
created_at date,
updated_at date,
country character varying(255),
longitude character varying(255),
latitude character varying(255),
tags character varying(255),
username character varying(30)
);

CREATE TABLE userbrewerydetails
(
obdb_id character varying(255) not null,
history character varying(255) not null,
image_url character varying(255) not null,
hour_open character varying(255) not null,
hour_closed character varying(255) not null,
open_sun boolean default false not null,
open_mon boolean default false not null,
open_tue boolean default false not null,
open_wed boolean default false not null,
open_thu boolean default false not null,
open_fri boolean default false not null,
open_sat boolean default false not null
);


CREATE TABLE beers (
beer_id serial PRIMARY KEY,
obdb_id character varying(255) not null,
beer_name character varying(255) not null,
brewery character varying(255) not null,
description character varying(255) default null,
image character varying(255) default null,
abv character varying(255) default null,
beer_type character varying(255) default null,
active character varying(1) not null,
constraint fk_obdb_id foreign key (obdb_id) references userbreweries(obdb_id)
);

CREATE TABLE reviews
(
review_id serial primary key unique,
beer_id int,
review_text character varying (255),
star_rating int,
username character varying (255) not null,
constraint fk_beer_id foreign key (beer_id) references beers(beer_id)
);

insert into userbreweries (obdb_id, name, street, city, state, postal_code, website_url, phone, username) values ('jeffs-tavern-and-brewhouse', 'Jeff''s Tavern & Brewhouse', '1 Cedar Point Drive', 'Sandusky', 'Ohio', '44870', null, '4405551234', 'tester');
insert into userbreweries (obdb_id, name, street, city, state, postal_code, website_url, phone, username) values ('pub-louis', 'Pub Louis', '1250 Pacific Ave #101', 'Tacoma', 'Washington', '98402', null, '4405551234', 'tester');
insert into userbreweries (obdb_id, name, street, city, state, postal_code, website_url, phone, username) values ('briannas-wing-and-dancehall', 'Brianna''s Wings & Dancehall', '300 Parkside Ave', 'Buffalo', 'New York', '14214', null, '4405551234', 'tester');
insert into userbreweries (obdb_id, name, street, city, state, postal_code, website_url, phone, username) values ('rikers-honey-hut', 'Riker''s Honey Hut', '4674 State Road', 'Cleveland', 'Ohio', '44109', null, '2167497077', 'riker');


insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('jeffs-tavern-and-brewhouse', 'Nitro Coconut Truffle', 'Southern Tier Brewing Company', 'Ale with sea salt, dark chocolate, and natural chocolate & coconut flavors.', 'https://i.imgur.com/ygrWulF.png', '10%', 'Imperial Milk Stout', 'Y');
insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('jeffs-tavern-and-brewhouse', 'Blueberry Maple Stout', 'Saugatuck Brewing Company', 'Rich, sweet stout with classic malt characteristics with a bold, unique twist of blueberry and maple.', 'https://i.imgur.com/UXQrafg.png', '4.3%', 'Sour Ale', 'Y');
insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('jeffs-tavern-and-brewhouse', 'Who Cooks For You', 'Jackie O''s Pub & Brewery', 'Double dry hopped pale ale with fruity, juicy flavors.', 'https://i.imgur.com/hakv1XA.jpg', '5.5%', 'Hazy Pale Ale', 'Y');

insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('pub-louis', 'Ottermelon Hefeweizen', 'Odd Otter', 'This Pale Ale is heavily dosed with Mosaic hops, the 2018 Washington Brewers Awards Gold medalist, boasts tropical and berry aromas.', 'https://i.imgur.com/6uK8LNa.jpg', '5%', 'Hefeweizen', 'Y');
insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('pub-louis', 'Hazy Ipa', '7 Seas Brewery', 'A soft, rounded mouthfeel asserts itself in this unfiltered IPA, loaded with newfangled hop varieties, for lots of juicy flavor and aroma.', 'https://i.imgur.com/twM3ZDn.png', '6.2%', 'New England IPA', 'Y');
insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('pub-louis', 'New Cleveland Palesner', 'Platform', 'This Pilsner / Pale Ale Hybrid is a clear straw color with a crisp German malt body', 'https://i.imgur.com/Cf7U0pA.jpg', '5%', 'Pilsner / Pale', 'Y');

insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('briannas-wing-and-dancehall', 'Giant Pacific Octopus', 'Narrows Brewing Company', 'Imagine yourself walking in the woods on a bright, sunny day. If that experience can be tasted, the hops in this IPA are its delivery mechanism.', 'https://i.imgur.com/LaIDnbk.jpg', '7.2%', 'IPA', 'Y');
insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('briannas-wing-and-dancehall', 'Delicious IPA', 'Stone','An IPA that lives up to the name', 'https://i.imgur.com/2SkZFng.png', '7.7%', 'IPA', 'Y');
insert into beers (obdb_id, beer_name, brewery, description, image, abv, beer_type, active) values ('briannas-wing-and-dancehall', 'Rose', 'Urban Artifact', 'Brut Fruit Tart Ale', 'https://i.imgur.com/gzRuSXD.jpg', '12%', 'Grape Ale', 'Y');

insert into userbrewerydetails (obdb_id, history, image_url, hour_open, hour_closed, open_sun, open_mon, open_tue, open_wed, open_thu, open_fri, open_sat) values ('jeffs-tavern-and-brewhouse', 'Jeff''s Tavern & Brewhouse has been a Sandusky staple for over a century. Come try the tasty Woodstock Express cocktail. Or the Corkscrew, if you''re into pain.', 'https://meltbarandgrilled.com/wp-content/gallery/gallery-location-melt-cedar-point/MELT_LOCATION_CEDAR_POINT_004.jpg', '11:00 AM', '11:00 PM', true, false, false, true, true, true, true);
insert into userbrewerydetails (obdb_id, history, image_url, hour_open, hour_closed, open_sun, open_mon, open_tue, open_wed, open_thu, open_fri, open_sat) values ('pub-louis', 'Pub Louis is the staple of modern society. Come get a buzz and regurgitate Gordon Wood with your friends.', 'https://i.imgur.com/xrlvaac.jpg', '10:00 AM', '11:00 PM', true, false, false, true, true, true, true);
insert into userbrewerydetails (obdb_id, history, image_url, hour_open, hour_closed, open_sun, open_mon, open_tue, open_wed, open_thu, open_fri, open_sat) values ('briannas-wing-and-dancehall', 'Home-brewed beers and home-grown women, come get a beer and a dance!', 'https://i.imgur.com/Kd5UGMb.jpg', '11:00 AM', '2:00 AM', true, false, false, true, true, true, true);
insert into userbrewerydetails (obdb_id, history, image_url, hour_open, hour_closed, open_sun, open_mon, open_tue, open_wed, open_thu, open_fri, open_sat) values ('rikers-honey-hut', 'Riker really likes ice cream and he loves Honey Hut because they make ice cream!', 'https://i.imgur.com/i3N1LZp.jpg', '8:00 AM', '8:30 PM', false, true, true, true, true, true, true);

insert into reviews (beer_id, review_text, star_rating, username) values (1, 'This was a very tasty beer. I enjoyed it!', 4, 'frankfella');
insert into reviews (beer_id, review_text, star_rating, username) values (2, 'The best of it''s kind. Always impressive.', 5, 'youngstowngirl');
insert into reviews (beer_id, review_text, star_rating, username) values (3, 'Overrated hipster swill. I still drink it, though.', 3, 'xX2Punk4YouXx');