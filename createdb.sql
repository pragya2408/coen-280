CREATE TABLE YELP_USER (
  YELPID varchar(10) PRIMARY KEY NOT NULL,
  email varchar(30) NOT NULL,
  firstname varchar(30) NOT NULL,
  LastName varchar(30) NOT NULL,
  DOB date NOT NULL,
  BirthPlace varchar(20) NOT NULL,
  gender varchar(20) NOT NULL,
  FriendList varchar(10),
  ComplimentedFriends varchar(10),
  CheckedinBusinesses varchar(10),
  foreign key (CheckedinBusinesses) references BUSINESS
);

INSERT INTO YELP_USER (YELPID,email,firstname,LastName,DOB,BirthPlace,gender,FriendList,ComplimentedFriends,CheckedinBusinesses) values
        ('Y1','john@yahoo.com','John','Smith','12-12-1992','FL','M','Y2,Y7,Y9','Y7, Y9','B3, B2, B13, B35, B36, B5, B4, B9'),
        ('Y2','juan@gmail.com','Juan','Carlos','07-02-1988','AK','M',null,null,'B10, B5, B11, B2, B36, B35'),
        ('Y3','Jane@gmail.com','Jane','Chapel','01-06-1980','IL','F','Y6,Y11,Y5','Y6',null),
        ('Y4','adi@yahoo.com','Aditya','Awasthi','12-04-1994','CA','M','Y7, Y11','Y11','B4, B11, B12, B5, B36, B35, B2'),
        ('Y5','james@hotmail.com','James','Williams','05-05-1991','NY','M',null,null,'B6, B11, B12, B5, B36, B35, B8'),
        ('Y6','mike@yahoo.com','Mike','Brown','01-03-1988','NC','M','Y2, Y4','Y4','B36, B11, B2, B3, B13'),
        ('Y7','bob@yahoo.com','Bob','Jones','02-19-1970','NY','M','Y1, Y3','Y3','B13, B35, B36, B11, B2, B3'),
        ('Y8','wei@gmail.com','Wei','Zhang','03-18-1975','NV','F','Y6,Y1','Y6','B11, B2, B13, B35, B36, B4'),
        ('Y9','mark@gmail.com','Mark','Davis','02-11-1993','CA','M','Y1,Y2','Y2','B5, B11, B2, B13 , B35, B36'),
        ('Y10','daniel@yahoo.com','Daniel','Garcia','10-05-1984','NJ','M',null,null,'B1, B5, B11, B2, B36, B35, B3'),
        ('Y11','maria@hotmail.com','Maria','Rodriguez','12-08-1985','CA','F','Y3,Y5','Y5','B3, B4 , B1, B5, B11, B2, B36, B35'),
        ('Y12','freya@yahoo.com','Freya','Wilson','05-10-1995','NJ','F','Y11','Y11','B7, B10, B5, B11, B2, B13 , B35, B36'),
        ('Y13','jzhang@gmail.com','John','Zhang','12-12-1995','NJ','M','Y12','Y10','B1, B2, B3, B4, B5')
;

CREATE TABLE AUTHOR (
    foreign key(YELPID) references YELP_USER,
    foreign key(ReviewID) references REVIEWS
    );

CREATE TABLE REVIEWS (
  ReviewID varchar(10) PRIMARY KEY NOT NULL,
  stars integer NOT NULL,
  YELPID varchar(5) NOT NULL,
  PublishDate date NOT NULL,
  BusinessID varchar(10) NOT NULL,
  listofcomments varchar(10),
  votefunny integer,
  voteuseful integer,
  votecool integer,
  TextualContent varCHAR(100),
  foreign key (YELPID) references YELP_USER,
  foreign key (BusinessID) references BUSINESS
);

INSERT INTO REVIEWS (ReviewID,stars,YELPID,PublishDate,BusinessID,listofcomments,votefunny,voteuseful,votecool) values
    ('R1','3','Y11','Oct-02-07','B3',NULL,'2','1','3')
    ('R2','2','Y10','Sep-29-07 13:45:00 PDT','B1','Y3,Y2','0','1','2'),
    ('R3','4','Y2','Sep-29-07 10:38:25 PDT','B10','Y3','3','2','0'),
    ('R4','5','Y11','Oct-02-07 13:05:56 PDT','B4',NULL,'2','2','1'),
    ('R5','5','Y1','Oct-25-07 17:15:00 PDT','B3',NULL,'3','1','2'),
    ('R6','5','Y4','Sep-26-07 17:15:00 PDT','B4',NULL,'5','1','3'),
    ('R7','5','Y9','Sep-26-07 17:15:00 PDT','B5','Y8,Y11','7','3','6'),
    ('R8','5','Y5','Sep-27-07 17:15:00 PDT','B6',NULL,'3','2','1'),
    ('R9','5','Y12','Sep-28-07 17:15:00 PDT','B7',NULL,'2','4','5'),
    ('R10','5','Y5','Oct-29-07 17:15:00 PDT','B8',NULL,'6','1','2'),
    ('R11','5','Y1','Sep-30-07 17:15:00 PDT','B9',NULL,'2','3','8'),
    ('R12','5','Y12','Oct-25-0717:15:00 PDT','B10',NULL,'2','1','4'),
    ('R13','5','Y4','Sep-25-07 17:15:00 PDT','B11',NULL,'5','6','2'),
    ('R14','5','Y5','Sep-25-07 17:15:00 PDT','B12',NULL,'2','3','5'),
    ('R15','5','Y1','Sep-29-07 17:15:00 PDT','B13','Y8','0','0','0'),
    ('R16','2','Y11','Jun-07-15 17:15:00 PDT','B2','Y8','1','1','2'),
    ('R17','1','Y4','May-05-15 17:15:00 PDT','B2',NULL,'2','3','2'),
    ('R18','1','Y1','May-05-15 17:15:00 PDT','B2',NULL,'1','4','3'),
    ('R19','1','Y10','Oct-25-07 17:15:00 PDT','B3',NULL,'4','2','3'),
    ('R20','1','Y1','Sep-28-07 17:15:00 PDT','B4','Y7,Y10','5','1','2'),
    ('R21','4','Y11','Jun-07-15 17:15:00 PDT','B14',NULL,'5','6','9'),
    ('R22','1','Y4','May-05-15 17:15:00 PDT','B14',NULL,'7','8','4'),
    ('R23','1','Y1','May-05-15 17:15:00 PDT','B14',NULL,'8','6','3'),
    ('R24','4','Y13','Jun-10-18 18:15:00 PDT','B1',NULL,'2','4','5')
;

CREATE TABLE BELONGS (
    ReviewID varchar(20),
    BusinessID varchar(20),
    foreign key(BusinessID) references BUSINESS,
    foreign key(ReviewID) references REVIEWS
    );
    
CREATE TABLE BUSINESS (
  BusinessID varchar(10) PRIMARY KEY NOT NULL,
  BusinessName varchar(100) NOT NULL,
  daysofoperation varchar(50) NOT NULL,
  ambienttype varchar(20),
  address varchar(100) NOT NULL,
  BusinessCategoryID varchar(20) NOT NULL,
  stars integer,
  ParkingType varchar(20),
  NoOfReviews integer,
  foreign key (BusinessCategoryID) references BUSINESS_CATEGORY
);

INSERT INTO BUSINESS (BusinessID,BusinessName,daysofoperation,ambienttype,address,BusinessCategoryID) values
    ('B1','Big Surf','Mon, Tue, Wed','Touristy','1500 N McClintock Dr, Tempe, AZ 85281','BCT1'),
    ('B2','SMITH THOMSON','Mon, Tue, Wed, Thu','Touristy','1595 Spring Hill Road Suite 110 Vienna VA 22182','BCT6, BCT4'),
    ('B3','Bay Area Coffee Shop','Mon, Tue, Wed','Touristy','1522 W. Sam Rayburn Dr. Bonham, CA 95051','BCT8, BCT6'),
    ('B4','China  Coffee Toffee','Mon, Tue, Wed','Touristy','2570 El Camino Real, Santa Clara, CA 95051','BCT4, BCT6'),
    ('B5','Hastings Water Works','Mon, Tue, Wed',NULL,'10331 Brecksville Rd. Brecksville, OH 44141','BCT7'),
    ('B6','Catch Your Big Break','Mon, Tue, Wed, Thu, Fri, Sat, Sun',NULL,'2341 Roosevelt Ct Santa Clara, CA 95051','BCT3'),
    ('B7','The Cinebar','Mon, Tue, Wed, Thu',NULL,'20285 South Western Ave., Suite # 200, Torrance, CA 90501','BCT5'),
    ('B8','Coffee Bar & Bistro','Mon, Tue, Wed',NULL,'2585 El Camino Real Santa Clara, CA','BCT5'),
    ('B9','Hobees','Mon, Tue, Wed, Thu, Fri',NULL,'90 Skyport Dr San Jose, CA 95110','BCT6'),
    ('B10','Cafe Gourmet','Mon, Tue',NULL,'80 N Market St San Jose, CA 95113','BCT6, BCT4'),
    ('B11','Yellow Stone National Park','Mon, Fri, Sat, Sun',NULL,'Yellow Stone National Park, WY 82190','BCT2'),
    ('B12','Petrified Forest National Park','Mon, Tue, Sun',NULL,'P.O. Box 221 AZ 86028','BCT2'),
    ('B13','Grand Canyon National park','Mon, Sat, Sun',NULL,'Highway 64, AZ 86023','BCT2'),
    ('B35','Connecticut Bar','Mon, Thu, Sun',NULL,'5847 San Felipe, Suite 2400 Houston, TX 77057','BCT5'),
    ('B36','Sherleys Bar & Restaurent','Mon, Wed, Sun',NULL,'1132 Terry Road, Hartford, CT 06105','BCT5, BCT6'),
    ('B14','Connecticut Bar & Restaurent','Mon, Wed, Sun',NULL,'1133 Terry Road, Hartford, CT 06105','BCT5')
;

CREATE TABLE RATE (
    PHOTO_AUTHOR varchar(20),
    BusinessID varchar(20),
    scale integer,
    foreign key(BusinessID) references BUSINESS,
    foreign key(YELPID) references YELP_USER
    );

CREATE TABLE BUSINESS_CATEGORY (
  BusinessCategoryID varchar(10) PRIMARY KEY NOT NULL,
  BusinessCategoryName varchar(100) NOT NULL,
  ListofSubcategories varchar(50) NOT NULL
);

INSERT INTO BUSINESS_CATEGORY values
    ('BCT1','Amusement Parks','Water Parks'),
    ('BCT2','National Parks','Wildlife National Parks'),
    ('BCT3','Career Counseling','Career Counselling for kids'),
    ('BCT4','Food and More','Ice-cream and Yougurt'),
    ('BCT5','Bars','Sports bar'),
    ('BCT6','Restaurants','Ice-cream and Yougurt'),
    ('BCT7','Pool Cleaners','Swimming pool cleaners'),
    ('BCT8','Coffee Shops','Cold coffee shops')
;

CREATE TABLE CHECKIN (
  ID varchar(10) PRIMARY KEY NOT NULL,
  Info varchar(100) NOT NULL,
  BusinessID varchar(50) NOT NULL,
  YELPID varchar(20),
  foreign key (BusinessID) references BUSINESS,
  foreign key (YELPID) references YELP_USER
);

INSERT INTO CHECKIN (ID,Info,BusinessID) values
    ('1','Checkin Info 1','B1'),
    ('2','Checkin Info 2','B2'),
    ('3','Checkin Info 3','B3'),
    ('4','Checkin Info 4','B4'),
    ('5','Checkin Info 5','B5'),
    ('6','Checkin Info 6','B6'),
    ('7','Checkin Info 7','B7'),
    ('8','Checkin Info 8','B8'),
    ('9','Checkin Info 9','B9'),
    ('10','Checkin Info 10','B10'),
    ('11','Checkin Info 11','B11'),
    ('12','Checkin Info 12','B12'),
    ('13','Checkin Info 13','B13')
;

CREATE TABLE PHOTO (
  PHOTOID varchar(10) PRIMARY KEY NOT NULL,
  Description varchar(100) NOT NULL,
  Location varchar(50) NOT NULL,
  PhotoType varchar(20),
  YELPID varchar(20),
  foreign key (YELPID) references YELP_USER
);

CREATE TABLE PHOTO_AUTHOR (
    PHOTOID varchar(20),
    YELPID varchar(20),
    foreign key(YELPID) references YELP_USER,
    foreign key(PHOTOID) references PHOTO
    );

