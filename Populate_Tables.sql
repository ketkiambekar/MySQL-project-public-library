#Run these queries to populate tables in Library Database
#Document 
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('To Kill a Mockingbird','1999-12-03',1);
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('Harry Potter and the Philosophers Stone','1999-12-04',2);
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('The Lord of the Rings','1999-12-05',3);
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('The Great Gatsby','1999-12-06',1);
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('Pride and Prejudice','1999-12-07',2);
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('The Diary Of A Young Girl','1999-12-08',5);
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('The Book Thief','1999-12-09',4);
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('The Power of Habit','1999-12-10',2);
INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('High Performance Habits','1999-12-11',3);

#Branch 
INSERT INTO `BRANCH`(`LNAME`, `LOCATION`) VALUES ('Jersey City','121, Grant St, Jersey City, NJ');
INSERT INTO `BRANCH`(`LNAME`, `LOCATION`) VALUES ('Newark','555 Washington St, Newark, NJ');
INSERT INTO `BRANCH`(`LNAME`, `LOCATION`) VALUES ('Trenton','345 Franklin Ave, Trenton, NJ');
INSERT INTO `BRANCH`(`LNAME`, `LOCATION`) VALUES ('Edison','234, MLK St, Edison, NJ');

#Publisher
INSERT INTO `PUBLISHER`( `PUBNAME`, `ADDRESS`) VALUES ('Bloomberg ','123 Central Ave Newark, NJ');
INSERT INTO `PUBLISHER`( `PUBNAME`, `ADDRESS`) VALUES ('Harper ','234 Broad St, Jersey City, NJ');
INSERT INTO `PUBLISHER`( `PUBNAME`, `ADDRESS`) VALUES ('Wiley ','345 Newark Ave, Elizabeth, NJ');
INSERT INTO `PUBLISHER`( `PUBNAME`, `ADDRESS`) VALUES ('Pearson','456 North Street, West Orange, NJ');
INSERT INTO `PUBLISHER`( `PUBNAME`, `ADDRESS`) VALUES ('Penguin','678 Grove St, Newport, NJ');

#Borrows-Borrowing
INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES('2012-12-03','2012-12-05','2012-12-23');INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),4,3,1,5);
INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES('2012-12-04',NULL,'2012-12-24');INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),1,4,3,7);
INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES('2012-12-05',NULL,'2012-12-25');INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),2,2,1,1);
INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES('2012-12-06','2012-12-15','2012-12-26');INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),6,7,4,6);
INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES('2012-12-07',NULL,'2012-12-27');INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),1,5,2,4);
INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES('2012-12-08','2012-12-21','2012-12-28');INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),5,3,3,1);
INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES('2012-12-09','2012-12-27','2012-12-29');INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),3,2,4,2);

#Reservation - Reserves
INSERT INTO RESERVATION (DTIME) VALUES('2012-12-03');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),1,5,4,7);
INSERT INTO RESERVATION (DTIME) VALUES('2012-12-04');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),4,7,3,2);
INSERT INTO RESERVATION (DTIME) VALUES('2012-12-05');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),7,4,2,5);
INSERT INTO RESERVATION (DTIME) VALUES('2012-12-06');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),3,3,2,4);
INSERT INTO RESERVATION (DTIME) VALUES('2012-12-07');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),5,6,1,2);
INSERT INTO RESERVATION (DTIME) VALUES('2012-12-08');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),2,5,3,3);
INSERT INTO RESERVATION (DTIME) VALUES('2012-12-09');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),4,1,1,1);

#Reader
INSERT INTO  `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Student','Alex Hamilton','1804, Greenwich Village, New York, NY','9917890704');
INSERT INTO  `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Senior Citizen','George Washington','George Washington''s Mount Vernon, Mount Vernon, VA','9217320899');
INSERT INTO  `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Student','Benjamin Franklin','Milk Street, Boston, MA','9717060490');
INSERT INTO  `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Staff','John Adams','','1017350726');
INSERT INTO  `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Senior Citizen','Samuel Adams','Boston, MA','9917221003');
INSERT INTO  `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Senior Citizen','Thomas Jefferson','Monticello, VA','9417430726');
INSERT INTO  `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Student','James Madison','James Madison''s Montpelier, Montpelier Station, VA','9317510636');
INSERT INTO  `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Staff','John Jay','Bedford, NY','1217450529');

#Copy
INSERT INTO `COPY`(`DOCID`, `BID`, `POSITION`) VALUES (1,1,'SA-Q-124');
INSERT INTO `COPY`(`DOCID`, `BID`, `POSITION`) VALUES (2,1,'SB-K-5223');
INSERT INTO `COPY`(`DOCID`, `BID`, `POSITION`) VALUES (1,1,'SQ-G-123');
INSERT INTO `COPY`(`DOCID`, `BID`, `POSITION`) VALUES (3,2,'SD-F-4563');
INSERT INTO `COPY`(`DOCID`, `BID`, `POSITION`) VALUES (4,2,'DE-G-3456');

#Person
INSERT INTO `PERSON`(`PNAME`) VALUES ('Darshan');
INSERT INTO `PERSON`(`PNAME`) VALUES ('Alex');
INSERT INTO `PERSON`(`PNAME`) VALUES ('Ketki');
INSERT INTO `PERSON`(`PNAME`) VALUES ('Jasneek');
INSERT INTO `PERSON`(`PNAME`) VALUES ('Thomas');
INSERT INTO `PERSON`(`PNAME`) VALUES ('Ravi');
INSERT INTO `PERSON`(`PNAME`) VALUES ('Ashley');

#Authors
INSERT INTO `AUTHORS`(`PID`, `DOCID`) VALUES (1,1);
INSERT INTO `AUTHORS`(`PID`, `DOCID`) VALUES (2,4);
INSERT INTO `AUTHORS`(`PID`, `DOCID`) VALUES (3,1);
INSERT INTO `AUTHORS`(`PID`, `DOCID`) VALUES (2,3);
INSERT INTO `AUTHORS`(`PID`, `DOCID`) VALUES (5,2); 

#Chairs
INSERT INTO `CHAIRS`(`PID`, `DOCID`) VALUES (1,2);
INSERT INTO `CHAIRS`(`PID`, `DOCID`) VALUES (2,7);
INSERT INTO `CHAIRS`(`PID`, `DOCID`) VALUES (4,8);
INSERT INTO `CHAIRS`(`PID`, `DOCID`) VALUES (5,2);
INSERT INTO `CHAIRS`(`PID`, `DOCID`) VALUES (7,9);

#Journal Volume
INSERT INTO `JOURNAL_VOLUME`(`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES (3,2,4);
INSERT INTO `JOURNAL_VOLUME`(`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES (6,2,4);
INSERT INTO `JOURNAL_VOLUME`(`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES (9,6,6);
INSERT INTO `JOURNAL_VOLUME`(`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES (7,7,7);
INSERT INTO `JOURNAL_VOLUME`(`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES (5,2,1);
INSERT INTO `JOURNAL_VOLUME`(`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES (1,6,2);

#Journal Issue
INSERT INTO `JOURNAL_ISSUE`(`DOCID`, `ISSUE_NO`, `SCOPE`) VALUES (1,1,'POLITICS');
INSERT INTO `JOURNAL_ISSUE`(`DOCID`, `ISSUE_NO`, `SCOPE`) VALUES (3,2,'TECH');
INSERT INTO `JOURNAL_ISSUE`(`DOCID`, `ISSUE_NO`, `SCOPE`) VALUES (5,3,'BIOLOGY');
INSERT INTO `JOURNAL_ISSUE`(`DOCID`, `ISSUE_NO`, `SCOPE`) VALUES (7,4,'SOCIAL');
INSERT INTO `JOURNAL_ISSUE`(`DOCID`, `ISSUE_NO`, `SCOPE`) VALUES (9,1,'TECH');

#Gedits
INSERT INTO `GEDITS`(`DOCID`, `ISSUE_NO`, `PID`) VALUES (1,4,1);
INSERT INTO `GEDITS`(`DOCID`, `ISSUE_NO`, `PID`) VALUES (2,3,3);
INSERT INTO `GEDITS`(`DOCID`, `ISSUE_NO`, `PID`) VALUES (3,2,2);
INSERT INTO `GEDITS`(`DOCID`, `ISSUE_NO`, `PID`) VALUES (2,1,5);
INSERT INTO `GEDITS`(`DOCID`, `ISSUE_NO`, `PID`) VALUES (5,2,7);

#Book
INSERT INTO `BOOK`(`DOCID`, `ISBN`) VALUES (1,'999-3-16-188870-0');
INSERT INTO `BOOK`(`DOCID`, `ISBN`) VALUES (2,'960-9-16-141910-0');
INSERT INTO `BOOK`(`DOCID`, `ISBN`) VALUES (3,'938-3-10-146510-0');
INSERT INTO `BOOK`(`DOCID`, `ISBN`) VALUES (4,'');
INSERT INTO `BOOK`(`DOCID`, `ISBN`) VALUES (5,'978-3-15-148410-0');

#Proceedings
INSERT INTO PROCEEDINGS(DOCID, CDATE, CLOCATION,CEDITOR) VALUES (7,'1999-12-03','Miami','Liam');
INSERT INTO PROCEEDINGS(DOCID, CDATE, CLOCATION,CEDITOR) VALUES (3,'1989-09-07','New York','Noah');
INSERT INTO PROCEEDINGS(DOCID, CDATE, CLOCATION,CEDITOR) VALUES (9,'1999-12-22','Chicago','Benjamin');
INSERT INTO PROCEEDINGS(DOCID, CDATE, CLOCATION,CEDITOR) VALUES (5,'2000-01-20','Houston','Elijah');
INSERT INTO PROCEEDINGS(DOCID, CDATE, CLOCATION,CEDITOR) VALUES (4,'2000-02-18','San Diego','Maxwell');