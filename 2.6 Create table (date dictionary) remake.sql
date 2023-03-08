create table Vendorrr(
	V_code int not null,
	V_name varchar(35) not null,
	V_contact varchar(25) not null,
	V_areacode char(3) not null,
	V_phone char(8) not null,
	V_state char(1) not null,
	V_order char(1) not null,
constraint PK_Vendorrr_V_code primary key(V_code),
constraint CK_Vendorrr_V_code check(V_code>=1000 and V_code<=9999),
constraint CK_Vendorrr_V_order check(V_order='Y' or V_order='N'),
);
go
create table Producttt(
	P_code varchar(10) not null,
	P_Descript varchar(35) not null,
	P_Indate date not null,
	P_Qoh smallint not null,
	P_Min smallint not null,
	P_Price numeric(8,2) not null,
	P_discount numeric(5,2),
	V_code int,
constraint PK_Producttt_P_code primary key(P_code),
constraint CK_Producttt_P_Qoh check(P_Qoh>0 and P_Qoh<10000),
constraint CK_Producttt_P_Min check(P_Min>0 and P_Min<10000),
constraint CK_Producttt_P_Price check(P_Price>0 and P_Price<9999.01),
constraint CK_Producttt_P_discount check(P_discount>0 and P_discount<0.21),
constraint FK_Producttt_V_Code foreign key(V_code) references Vendorrr(V_code),
);


