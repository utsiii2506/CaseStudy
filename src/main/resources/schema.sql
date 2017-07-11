drop table CURRENCY if exists;
drop table USERS if exists;
drop table SUC_TRANSACTION if exists;
drop table LIMIT_ORDER if exists;

create table CURRENCY (
CID int(20) NOT NULL AUTO_INCREMENT,
PAIR varchar(255) NOT NULL,
RATE double NOT NULL,
PRIMARY KEY(CID) 
);

create table SUC_TRANSACTION(
TID int(20) NOT NULL AUTO_INCREMENT,
USERNAME varchar(255) NOT NULL,
CID varchar(255) NOT NULL,
QUANTITY int(20) NOT NULL,
AMOUNT INT(20) NOT NULL,
STATUS VARCHAR(1) NOT NULL,
UTC TIMESTAMP NOT NULL,
PRIMARY KEY(TID),

);

create table LIMIT_ORDER(
LID int(20) NOT NULL AUTO_INCREMENT,
USERNAME varchar(255) NOT NULL,
CID varchar(255) NOT NULL,
QUANTITY int(20) NOT NULL,
THRESHOLD INT(20) NOT NULL,
STATUS VARCHAR(1) NOT NULL,
PRIMARY KEY(LID)
);

create table USERS(
USERNAME VARCHAR(255) NOT NULL,
PASSWORD VARCHAR(255) NOT NULL,
PRIMARY KEY(USERNAME)

);

alter table LIMIT_ORDER ADD FOREIGN KEY(USERNAME) references USERS(USERNAME);
alter table LIMIT_ORDER ADD FOREIGN KEY(CID) references CURRENCY(CID);
alter table SUC_TRANSACTION ADD FOREIGN KEY(USERNAME) references USERS(USERNAME);
alter table SUC_TRANSACTION ADD FOREIGN KEY(CID) references CURRENCY(CID);

