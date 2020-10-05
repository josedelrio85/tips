#postgreSQL 

create table account_test(
	user_id int identity(1,1), 
	username varchar (50) unique not null, 
	password varchar(50) not null, 
	email varchar(355) unique not null, 
	created_on timestamp not null, 
	last_login timestamp
);

# Tips
# 	- En redshift no hay soporte para tipo campo serial, hay que usar IDENTITY(seed, step)

create table role_test(
	role_id int identity(1,1),
	role_name varchar(255)
);

create table account_role_test(
	user_id integer NOT NULL,
	role_id integer NOT NULL,
	grant_date timestamp without time zone,
	PRIMARY  KEY(user_id, role_id),
	CONSTRAINT account_role_role_id_fkey FOREIGN KEY (role_id)
		REFERENCES role_test(role_id) MATCH SIMPLE
		# ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id)
		REFERENCES account_test(user_id) MATCH SIMPLE
		# ON UPDATE NO ACTION ON DELETE NO ACTION
);

create table account_role_test(user_id integer NOT NULL,role_id integer NOT NULL,grant_date timestamp without time zone, PRIMARY KEY(user_id, role_id),	CONSTRAINT account_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES role_test(role_id) MATCH SIMPLE, CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES account_test(user_id) MATCH SIMPLE );


# show tables
\dt


psql -h eventorama.cymslpfsuzk0.eu-west-1.redshift.amazonaws.com -p 5439 -d dev -U root -f C:\Users\Jose\Documents\AWS_Redshift_PostgreSQL\load_data_redshift.sql
