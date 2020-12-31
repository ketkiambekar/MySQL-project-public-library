##############################
##### Reader Menu ########
##############################

#1) Search by ID, Title , Publisher: 
Select * from DOCUMENT where DOCID = 8 OR Title = 'Pride and Prejudice' OR PublisherID = 1

#2) Document Checkout
INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES('2012-12-03',’’,'2012-12-23');
INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),4,3,1,5);

#3) Document Return
Update BORROWING Set RDTIME =CURRENT_DATE Where BOR_NO=(Select BOR_NO from BORROWS where RID =3 and DOCID=2 and  BID=2 and  COPYNO=1);

#4) Document Reserve
INSERT INTO RESERVATION (DTIME) VALUES(CURRENT_DATE());
INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),1,5,4,7);

#5) Compute fine for a document copy borrowed by a reader based on the current date. 
Select *, IF(b2.RDTIME is NULL and DATEDIFF(CURRENT_DATE, b2.BDTIME)>30, DATEDIFF(CURRENT_DATE, b2.BDTIME)*0.2,0)
from BORROWS b1, BORROWING b2 
WHERE b1.BOR_NO=b2.BOR_NO and b1.RID=3 

#6) Print the list of documents reserved by a reader and their status.
	
SELECT b1.DOCID, b1.COPYNO, b1.BID,
CASE 
WHEN b2.RDTIME is NULL THEN "Not Available" 
ELSE "Available" 
END AS STATUS

FROM BORROWS b1, BORROWING b2
WHERE  b2.BOR_NO = b1.BOR_NO 
AND b1.DOCID in (SELECT r.DOCID FROM RESERVES r where r.RID = 3);

#7) Print the document id and document titles of documents published by a publisher.

Select * from DOCUMENT where PUBLISHERID=3


##############################
##### Admin Menu ########
##############################

#1)Add a document copy.

INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES ('To Kill a Mockingbird','1999-12-03',1);

#2) Search document copy and check its status.

SELECT * , 
CASE 
WHEN b2.RDTIME is NULL THEN "Not Available" 
WHEN b2.RDTIME is not NULL THEN "Available" 
END AS STATUS

FROM COPY c, BORROWS b1, BORROWING b2
WHERE c.COPYNO = b1.COPYNO AND c.DocID = b1.DocID AND c.BID = b1.BID
AND b1.BOR_NO = b2. BOR_no
AND c.COPYNO=1


#3) Add new reader.

	INSERT INTO `READER`( `RTYPE`, `RNAME`, `RADDRESS`,`PHONE_NO`) VALUES ('Student','Alex Hamilton','1804, Greenwich Village, New York, NY','9917890704');

#4)Print branch information (name and location).
Select * from Branch  

#5) Get number N and branch number I as input and print the top N most frequent borrowers (Rid and name) in branch I and the number of books each has borrowed

Select b.BID, r.rid,r.RNAME , count(b.BOR_NO) 
from BORROWS b, READER r
Where  b.RID = r.RID
and b.BID=2
GROUP BY b.rID
ORDER BY count(b.BOR_NO) desc LIMIT 10


#6) Get number N as input and print the top N most frequent borrowers (Rid and name) in the library and the number of BOOK each has borrowed.

Select r.rid,r.RNAME , count(b.BOR_NO) 
from BORROWS b, READER r
Where  b.RID = r.RID
GROUP BY b.RID
ORDER BY count(b.BOR_NO) desc LIMIT 5



#7) Get number N and branch number I as input and print the N most borrowed books in branch I.

Select b.BID,d.TITLE ,count(b.BOR_NO) 
from BORROWS b,  DOCUMENT d
Where   d.DOCID = b.DOCID
and b.BID=1                         # I
GROUP BY d.DOCID
ORDER BY count(*) desc LIMIT 4      # N



#8) Get number N as input and print the N most borrowed books in the library.

Select b.DOCID , d.TITLE, count(b.BOR_NO) 
from BORROWS b, DOCUMENT d 
Where b.DOCID= d.DOCID
GROUP BY d.DOCID 
ORDER BY count(b.BOR_NO) desc LIMIT 3


#9) Get a year as input and print the 10 most popular books of that year in the library.

Select b.DOCID , d.TITLE, count(b.BOR_NO) 
#Select *, COUNT(b.BOR_NO)
from BORROWS b, DOCUMENT d , BORROWING b2
Where b.DOCID= d.DOCID 
and b.BOR_NO=b2.BOR_NO
and b2.BDTIME between '2012-01-01' and '2012-12-31'
GROUP BY d.DOCID 
ORDER BY count(b.BOR_NO) desc LIMIT 10


#10) Get a start date S and an end date E as input and print, for each branch, the branch Id and name and the average fine paid by the borrowers for documents borrowed from this branch during the corresponding period of time.

Select b3.LNAME, b3.BID, 
Avg(IF(b2.bdtime between '2019-12-01' and '2019-12-15' and b2.RDTIME is NULL and DATEDIFF(CURRENT_DATE, b2.BDTIME)>30, DATEDIFF(CURRENT_DATE, b2.BDTIME)*0.2,NULL))
from BORROWS b1, BORROWING b2 , BRANCH b3
WHERE b1.BOR_NO=b2.BOR_NO 
and b1.BID = b3.BID
Group By b3.BID





