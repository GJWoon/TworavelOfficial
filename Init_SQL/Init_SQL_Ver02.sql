DROP TABLE GLike;
DROP TABLE GAdd;
DROP TABLE Gallery;
DROP TABLE Map;
DROP TABLE CompanionMap;
DROP TABLE CTag;
DROP TABLE Favor;
DROP TABLE Category;
DROP TABLE CAdd;
DROP TABLE CompanionInfo;
DROP TABLE Report;
DROP TABLE CLike;
DROP TABLE Out;
DROP TABLE BLike;
DROP TABLE Board;
DROP TABLE MLike;
DROP TABLE Companion;
DROP TABLE Member;

CREATE TABLE Member (
	M_ID	VARCHAR2(500)	NOT NULL,
	M_PW	VARCHAR2(500)	NULL,
	M_NAME	VARCHAR2(500)	NULL,
	M_NICK	VARCHAR2(500)	NULL,
	M_BIRTH	DATE	NULL,
	M_GENDER	CHAR(1)	CHECK (M_GENDER IN ('M', 'F')) NULL,
	M_ADDRESS	VARCHAR2(1000)	NULL,
    M_ADDRESS_DETAIL	VARCHAR2(1000)	NULL,
	M_LIKE	NUMBER DEFAULT 0	NULL,
	M_JOINDATE	DATE DEFAULT SYSDATE	NULL,
	M_INTRO	VARCHAR2(1000)	NULL,
	M_VISIT	NUMBER DEFAULT 0	NULL,
	M_IMAGE	VARCHAR2(500)	NULL,
	M_STATUS	CHAR(1) DEFAULT 'L' CHECK (M_STATUS IN ('O','L'))	NULL,
	M_LOGINDATE	DATE	NULL,
	M_REPORTCOUNT	NUMBER DEFAULT 0	NULL,
	M_PHONE	VARCHAR2(100)	NULL,
	M_EMAIL	VARCHAR2(1000)	NULL,
	M_EMAILHASH	VARCHAR2(1000)	NULL,
	M_AUTHORIZATION	CHAR(1) DEFAULT 'U' CHECK(M_AUTHORIZATION IN ('U', 'M'))	NULL,
	M_JOINWAY	VARCHAR2(20) DEFAULT 'MY'	NULL,
	M_POINT	NUMBER DEFAULT 1000	NULL
);



CREATE TABLE Category (
	C_LID	NUMBER	NOT NULL,
	C_SID	NUMBER	NOT NULL,
	C_NAME	VARCHAR2(500)	NULL
);


CREATE TABLE Out (
	M_ID	VARCHAR2(500)	NOT NULL,
	O_STATUS	CHAR(1) CHECK (O_STATUS IN ('Y', 'N'))	NULL,
	O_OUTDATE	DATE	NULL,
	O_REASON	VARCHAR2(2000)	NULL
);



CREATE TABLE Report (
	R_ID	NUMBER	NOT NULL,
	M_ID	VARCHAR2(500)	NOT NULL,
	M_ID2	VARCHAR2(500)	NOT NULL,
	R_REASON	VARCHAR2(4000)	NULL
);



CREATE TABLE Board (
	B_ID	NUMBER	NOT NULL,
	M_ID	VARCHAR2(500)	NOT NULL,
	B_TYPE	CHAR(1)	NULL,
	B_TITLE	VARCHAR2(1000)	NULL,
	B_TIMESTAMP	TIMESTAMP	NULL,
	B_VIEW	NUMBER	NULL,
	B_LIKE	NUMBER	NULL,
	B_CONTENT	VARCHAR2(4000)	NULL,
	B_SECRET	CHAR(1) CHECK(B_SECRET IN ('Y', 'N'))	NULL,
	B_SECRETNUMBER	NUMBER	NULL,
	B_REF	NUMBER	NULL,
	B_RE_STEP	NUMBER	NULL,
	B_RE_LEVEL	NUMBER	NULL
);



CREATE TABLE Favor (
	M_ID	VARCHAR2(500)	NOT NULL,
	C_LID	NUMBER	NOT NULL,
	C_SID	NUMBER	NOT NULL
);



CREATE TABLE CAdd (
	C_ID	NUMBER	NOT NULL,
	CA_IMG1	VARCHAR2(4000)	NULL,
	CA_IMG2	VARCHAR2(4000)	NULL,
	CA_IMG3	VARCHAR2(4000)	NULL
);



CREATE TABLE BLike (
	B_ID	NUMBER	NOT NULL,
	M_ID	VARCHAR2(500)	NOT NULL
);



CREATE TABLE CLike (
	C_ID	NUMBER	NOT NULL,
	M_ID	VARCHAR2(500)	NOT NULL
);



CREATE TABLE MLike (
	M_ID	VARCHAR2(500)	NOT NULL,
	M_ID2	VARCHAR2(500)	NOT NULL
);



CREATE TABLE Companion (
	C_ID	NUMBER	NOT NULL,
	M_ID	VARCHAR2(500)	NOT NULL,
	C_NAME	VARCHAR2(4000)	NULL,
	C_ADDDATE	DATE	NULL,
	C_VALUE	NUMBER	NULL,
	C_MANY	NUMBER	NULL,
	C_DESCRIPTION	VARCHAR2(4000)	NULL,
	C_LIKE	NUMBER	NULL,
	C_DEALSTATUS	CHAR(1)	NULL,
	C_VIEW	NUMBER	NULL,
	C_STARTD	DATE	NULL,
	C_ENDD	DATE	NULL,
	C_MEET	VARCHAR2(2000)	NULL,
	C_ADDRESS	VARCHAR2(4000)	NULL
);



CREATE TABLE CTag (
	C_ID	NUMBER	NOT NULL,
	C_LID	NUMBER	NOT NULL,
	C_SID	NUMBER	NOT NULL
);



CREATE TABLE CompanionInfo (
	C_ID	NUMBER	NOT NULL,
    M_ID2 VARCHAR2(500) NOT NULL,
	M_ID	VARCHAR2(500)	NOT NULL,
    C_NAME VARCHAR2(4000),
	C_YN	CHAR(1)	NULL
);



CREATE TABLE CompanionMap (
	CM_ID	NUMBER	NOT NULL,
	C_ID	NUMBER	NOT NULL,
	C_XY	VARCHAR(4000)	NULL
);



CREATE TABLE Map (
	MAP_X	varchar(200)	NULL,
	MAP_Y	varchar(200)	NULL,
	MAP_TEL	varchar(200)	NULL,
	MAP_TITLE	varchar(200)	NULL,
	MAP_ADDRESS	varchar(200)	NULL
);

CREATE TABLE Gallery (
    G_ID NUMBER NOT NULL,
    M_ID VARCHAR2(500) NOT NULL,
    G_LIKE NUMBER DEFAULT 0 NOT NULL,
    G_CONTENT VARCHAR2(500) NULL,
    G_VIEW NUMBER DEFAULT 0 NOT NULL
);

CREATE TABLE GAdd(
    G_ID NUMBER NOT NULL,
    G_IMG1 VARCHAR2(4000) NULL,
    G_IMG2 VARCHAR2(4000) NULL,
    G_IMG3 VARCHAR2(4000) NULL
);

CREATE TABLE GLike(
    G_ID NUMBER NOT NULL,
    M_ID VARCHAR2(500) NOT NULL
);

ALTER TABLE Member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	M_ID
);

ALTER TABLE Category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	C_LID,
	C_SID
);

ALTER TABLE Out ADD CONSTRAINT PK_OUT PRIMARY KEY (
	M_ID
);

ALTER TABLE Report ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	R_ID
);

ALTER TABLE Board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	B_ID
);

ALTER TABLE CAdd ADD CONSTRAINT PK_CADD PRIMARY KEY (
	C_ID
);


ALTER TABLE BLike ADD CONSTRAINT PK_BLIKE PRIMARY KEY (
	B_ID,
	M_ID
);

ALTER TABLE CLike ADD CONSTRAINT PK_CLIKE PRIMARY KEY (
	C_ID,
	M_ID
);

ALTER TABLE Companion ADD CONSTRAINT PK_COMPANION PRIMARY KEY (
	C_ID
);

ALTER TABLE CompanionMap ADD CONSTRAINT PK_COMPANIONMAP PRIMARY KEY (
	CM_ID,
	C_ID
);
ALTER TABLE Gallery ADD CONSTRAINT PK_GALLERY PRIMARY KEY (
	G_ID
);
ALTER TABLE GAdd ADD CONSTRAINT PK_GADD PRIMARY KEY (
	G_ID
);
ALTER TABLE GLike ADD CONSTRAINT PK_GLIKE PRIMARY KEY (
	G_ID,
    M_ID
);
ALTER TABLE Out ADD CONSTRAINT FK_Member_TO_Out_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE CAdd ADD CONSTRAINT FK_Companion_TO_CAdd_1 FOREIGN KEY (
	C_ID
)
REFERENCES Companion (
	C_ID
);

ALTER TABLE BLike ADD CONSTRAINT FK_Board_TO_BLike_1 FOREIGN KEY (
	B_ID
)
REFERENCES Board (
	B_ID
);

ALTER TABLE BLike ADD CONSTRAINT FK_Member_TO_BLike_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE CLike ADD CONSTRAINT FK_Companion_TO_CLike_1 FOREIGN KEY (
	C_ID
)
REFERENCES Companion (
	C_ID
);

ALTER TABLE CLike ADD CONSTRAINT FK_Member_TO_CLike_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE CompanionMap ADD CONSTRAINT FK_Companion_TO_CompanionMap_1 FOREIGN KEY (
	C_ID
)
REFERENCES Companion (
	C_ID
);

ALTER TABLE Report ADD CONSTRAINT FK_Member_TO_Report_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE Report ADD CONSTRAINT FK_Member_TO_Report_2 FOREIGN KEY (
	M_ID2
)
REFERENCES Member (
	M_ID
);

ALTER TABLE Companion ADD CONSTRAINT FK_Member_TO_Companion_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE Favor ADD CONSTRAINT FK_Member_TO_Favor_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE Favor ADD CONSTRAINT FK_Category_TO_Favor_1 FOREIGN KEY (
	C_LID, C_SID
)
REFERENCES Category (
	C_LID, C_SID
);

ALTER TABLE CTag ADD CONSTRAINT FK_Companion_TO_CTag_1 FOREIGN KEY (
	C_ID
)
REFERENCES  Companion(
	C_ID
);

ALTER TABLE CTag ADD CONSTRAINT FK_Category_TO_CTag_1 FOREIGN KEY (
	C_LID, C_SID
)
REFERENCES Category (
	C_LID, C_SID
);

ALTER TABLE Board ADD CONSTRAINT FK_Member_TO_Board_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE MLike ADD CONSTRAINT FK_Member_TO_MLike_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE MLike ADD CONSTRAINT FK_Member_TO_MLike_2 FOREIGN KEY (
	M_ID2
)
REFERENCES Member (
	M_ID
);

ALTER TABLE CompanionInfo ADD CONSTRAINT FK_Member_TO_CompanionInfo_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE CompanionInfo ADD CONSTRAINT FK_Member_TO_CompanionInfo_2 FOREIGN KEY (
	M_ID2
)
REFERENCES Member (
	M_ID
);

ALTER TABLE CompanionInfo ADD CONSTRAINT FKCompanionTOCompanionInfo1 FOREIGN KEY (
	C_ID
)
REFERENCES Companion (
	C_ID 
);

ALTER TABLE Gallery ADD CONSTRAINT FK_Member_TO_Gallery FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID 
);

ALTER TABLE GAdd ADD CONSTRAINT FK_Gallery_TO_GAdd FOREIGN KEY(
    G_ID
)
REFERENCES Gallery(
    G_ID
);

ALTER TABLE GLike ADD CONSTRAINT FK_Gallery_TO_GLike FOREIGN KEY(
    G_ID
)
REFERENCES Gallery(
    G_ID
);

ALTER TABLE GLike ADD CONSTRAINT FK_Member_TO_GLike FOREIGN KEY(
    M_ID
)
REFERENCES Member(
    M_ID
);

insert into Member values('potatotravel', 'potatotravel', 'potatotravel', 'potatotravel', sysdate, 'M', 'potatotravel_address', 'potatotravel_address_detail', 0, sysdate, 'potatotravel', 0, 'potatotravel', 'O', SYSDATE, 0, '010-0000-0000', 'nothing1360@gmail.com', 'potatotravel', 'M', 'MY', 0);
insert into Out values('potatotravel', 'N', null, null);

commit;