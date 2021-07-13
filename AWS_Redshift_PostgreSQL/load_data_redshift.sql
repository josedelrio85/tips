create table users(
	userid integer not null distkey sortkey,
	username char(8),
	firstname varchar(30),
	lastname varchar(30),
	city varchar(30),
	state char(2),
	email varchar(100),
	phone char(14),
	likesports boolean,
	liketheatre boolean,
	likeconcerts boolean,
	likejazz boolean,
	likeclassical boolean,
	likeopera boolean,
	likerock boolean,
	likevegas boolean,
	likebroadway boolean,
	likemusicals boolean);

create table venue(
	venueid smallint not null distkey sortkey,
	venuename varchar(100),
	venuecity varchar(30),
	venuestate char(2),
	venueseats integer);

create table category(
	catid smallint not null distkey sortkey,
	catgroup varchar(10),
	catname varchar(10),
	catdesc varchar(50));

create table date(
	dateid smallint not null distkey sortkey,
	caldate date not null,
	day character(3) not null,
	week smallint not null,
	month character(5) not null,
	qtr character(5) not null,
	year smallint not null,
	holiday boolean default('N'));

create table event(
	eventid integer not null distkey,
	venueid smallint not null,
	catid smallint not null,
	dateid smallint not null sortkey,
	eventname varchar(200),
	starttime timestamp);

create table listing(
	listid integer not null distkey,
	sellerid integer not null,
	eventid integer not null,
	dateid smallint not null  sortkey,
	numtickets smallint not null,
	priceperticket decimal(8,2),
	totalprice decimal(8,2),
	listtime timestamp);

create table sales(
	salesid integer not null,
	listid integer not null distkey,
	sellerid integer not null,
	buyerid integer not null,
	eventid integer not null,
	dateid smallint not null sortkey,
	qtysold smallint not null,
	pricepaid decimal(8,2),
	commission decimal(8,2),
	saletime timestamp);



	IP               string `json:"ip"`
	Utm              string `json:"utm"`
	Browser          string `json:"browser"`
	Device           string `json:"device"`
	Country          string `json:"country"`
	City             string `json:"city"`
	Event            string `json:"event"`
	Provider         string `json:"provider"`  			=> cliente o campaña (Abanca, Evo, Sanpancracio ...)
	Application      string `json:"application"`   		=> diferentes lps de una campaña
	Eventdate        string `json:"eventdate"`
	Receiveddate     string `json:"receiveddate"`
	URL              string `json:"url"`
	Idjosedelrio85group string `json:"id_josedelrio85_group"`	=> generado por servicio externo
	Idjosedelrio85      string `json:"id_josedelrio85"`		=> generado por servicio externo



create table events(
	ip varchar(100),
	utm varchar(255),
	browser varchar(255),
	device varchar(255),
	country varchar(255),
	city varchar(255),
	event varchar(255),
	provider varchar(255),
	application varchar(255),
	eventdate timestamp sortkey,
	receiveddate timestamp,
	url varchar(255),
	id_josedelrio85_group varchar(255),
	id_josedelrio85 varchar(255)
);