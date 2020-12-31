import mysql.connector as mc
from tkinter import  ttk
from tkinter import  *
import tkinter as tk
from datetime import datetime, timedelta

conn = mc.connect(
    host="198.20.112.34",
    user="ketkiamb_libuser",    
    password = "andekafunda",
    database="ketkiamb_lib"
    )

def searchDocument():
    output1.delete(0.0,END)
    SearchQuery1= q1SearchQuery_textBox1.get()
    SearchQuery2= q1SearchQuery_textBox2.get()
    QueryString = "Select * from DOCUMENT where"

    if len(SearchQuery1)>0:
        QueryString +=" DOCID ="+SearchQuery1+" OR PublisherID = "+SearchQuery1
    if len(SearchQuery2)>0:
            if SearchQuery1!="":
                QueryString +=" OR Title = '"+SearchQuery2+"'"
            else:
                QueryString +=" Title = '"+SearchQuery2+"'"

    try:
        cursor=conn.cursor()
        cursor.execute(QueryString)
        result= cursor.fetchall()
        resultString=""
        for r in result:
            resultString+="\n"+str(r)
    except:
        resultString="Some Error Occured. Could not fetch Search Results"
    cursor=None
    output1.insert(0.0, "Search Results\n"+resultString)


def checkout():
    output1.delete(0.0,END)
    RID = q2SearchQuery_textBox4.get()
    DocID= q2SearchQuery_textBox1.get()
    BID = q2SearchQuery_textBox2.get()
    CopyNO= q2SearchQuery_textBox3.get()
    Bdate = datetime.today().isoformat()
    DueDate = (datetime.today()+timedelta(days=30)).isoformat()
    QueryString = "INSERT INTO BORROWING (BDTIME,RDTIME,DUEDATE) VALUES(\'"+Bdate+"\',NULL,\'"+DueDate+"\');"
    QueryString += "INSERT INTO BORROWS (BOR_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(BOR_NO) FROM BORROWING ),"+RID+","+DocID+","+BID+","+CopyNO+");";
    #QueryString += "Select * from BORROWS;"
    try:
        cursor=conn.cursor()
        cursor.execute(QueryString)
        result= cursor.fetchall()
        resultString="Query Inserted. Checkout Complete."
        #for r in result:
         #   resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output1.insert(END, resultString)

def returnDoc():
    output1.delete(0.0,END)

    RID = q2SearchQuery_textBox4.get()
    DocID= q2SearchQuery_textBox1.get()
    BID = q2SearchQuery_textBox2.get()
    CopyNO= q2SearchQuery_textBox3.get()
    Rdate = datetime.today().isoformat()
   
    #QueryString = "Update BORROWING Set RDTIME =\'"+Rdate+"\' Where BOR_NO=(Select BOR_NO from BORROWS where RID ="+RID+" and DOCID="+DocID+");"
    QueryString = "Update BORROWING Set RDTIME =\'"+Rdate+"\' Where BOR_NO=(Select BOR_NO from BORROWS where RID ="+RID+" and DOCID="+DocID+" and  BID="+BID+" and  COPYNO="+CopyNO+");"
    #QueryString +="Select * from BORROWS;"

    try:
        cursor=conn.cursor()
        cursor.execute(QueryString)
        result= cursor.fetchall()
        resultString="Inserted"
        # for r in result:
        #     resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output1.insert(END, resultString)

def reserve():
    output1.delete(0.0,END)
    RID = q2SearchQuery_textBox4.get()
    DocID= q2SearchQuery_textBox1.get()
    BID = q2SearchQuery_textBox2.get()
    CopyNO= q2SearchQuery_textBox3.get()
    Dtime = datetime.today().isoformat()
    #QueryString = "Update BORROWING Set RDTIME =\'"+Rdate+"\' Where BOR_NO=(Select BOR_NO from BORROWS where RID ="+RID+" and DOCID="+DocID+" and  BID="+BID+" and  COPYNO="+CopyNO+");"
    QueryString = "INSERT INTO RESERVATION (DTIME) VALUES(\'"+Dtime+"\');INSERT INTO RESERVES (RESERVATION_NO,RID,DOCID,BID,COPYNO) VALUES((SELECT MAX(RES_NO) FROM RESERVATION ),"+RID+","+DocID+","+BID+","+CopyNO+");"

    try:
        cursor=conn.cursor()
        cursor.execute(QueryString)
        #result= cursor.fetchall()
        cursor=None
        resultString="Inserted"
        # for r in result:
        #     resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output1.insert(END, resultString)

def getTable(tableName):
    output1.delete(0.0,END)
    try:
        QueryString="Select * from "+ tableName.upper()
        cursor=conn.cursor()
        cursor.execute(QueryString)
        result= cursor.fetchall()
        resultString=""
        for r in result:
            resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output1.insert(END, resultString)

def getStatus():
    output1.delete(0.0,END)
    RID = q3SearchQuery_textBox1.get()
    QueryString="SELECT b1.DOCID, b1.COPYNO, b1.BID, CASE WHEN b2.RDTIME is NULL THEN 'Not Available' ELSE 'Available' END AS STATUS FROM BORROWS b1, BORROWING b2 WHERE  b2.BOR_NO = b1.BOR_NO AND b1.DOCID in (SELECT r.DOCID FROM RESERVES r where r.RID ="+RID+ ");"

    try:
        cursor=conn.cursor()
        cursor.execute(QueryString)
        result= cursor.fetchall()
        resultString=""
        for r in result:
            resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output1.insert(END, resultString)


def addDocument():
    output2.delete(0.0,END)
    Title = t2q1SearchQuery_textBox1.get()
    PDate = t2q1SearchQuery_textBox2.get()
    PublisherID = t2q1SearchQuery_textBox3.get()
    QueryString = "INSERT INTO `DOCUMENT`( `TITLE`, `PDATE`, `PUBLISHERID`) VALUES (\'"+Title+"\',\'"+PDate+"\',"+PublisherID+");"
    try:
        cursor=conn.cursor()
        cursor.execute(QueryString)
        #result= cursor.fetchall()
        resultString="Inserted"
        # for r in result:
        #     resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output2.insert(END, resultString)

def getNBorrowed():
    output2.delete(0.0,END)
    N = t2q2SearchQuery_textBox1.get()
    QueryString = "Select b.DOCID , d.TITLE, count(b.BOR_NO) from BORROWS b, DOCUMENT d Where b.DOCID= d.DOCID GROUP BY d.DOCID ORDER BY count(b.BOR_NO) desc LIMIT "+N

    try:
        cursor=conn.cursor()
        cursor.execute(QueryString)
        result= cursor.fetchall()
        resultString=""
        for r in result:
            resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output2.insert(END, resultString)

def getAvgFine():
    output2.delete(0.0,END)
    StartDate = t2q3SearchQuery_textBox1.get()
    EndDate = t2q3SearchQuery_textBox2.get()
    QueryString = "Select b3.LNAME, b3.BID, Avg(IF(b2.bdtime between '"+StartDate+"' and '"+EndDate+"' and b2.RDTIME is NULL and DATEDIFF(CURRENT_DATE, b2.BDTIME)>30, DATEDIFF(CURRENT_DATE, b2.BDTIME)*0.2,NULL)) from BORROWS b1, BORROWING b2 ,BRANCH b3 WHERE b1.BOR_NO=b2.BOR_NO and b1.BID = b3.BID Group By b3.BID"
    try:
        cursor=conn.cursor()
        cursor.execute(QueryString)
        result= cursor.fetchall()
        resultString=""
        for r in result:
            resultString+="\n"+str(r)
    except BaseException as e:
        resultString="Some Error Occured. Could not fetch Search Results. "+ str(e)
    cursor=None
    output2.insert(END, resultString)

def popupReader():
    popup =tk.Tk()
    popup.wm_title("Login Success")
    popup.eval('tk::PlaceWindow . center')
   
    label= ttk.Label(popup, text="Login Success! Welcome Reader")
    label.pack()
    Btn = ttk.Button(popup, text="Okay", command=popup.destroy)
    Btn.pack()
    popup.geometry("300X300")
    popup.mainloop()

def popupAdmin():
    popup =tk.Tk()
    popup.wm_title("Login Success")
    popup.eval('tk::PlaceWindow . center')
    label= ttk.Label(popup, text="Login Success! Welcome Admin")
    label.pack()
    Btn = ttk.Button(popup, text="Okay", command=popup.destroy)
    Btn.pack()
    popup.geometry("300X300")
    popup.mainloop()

    
#######Form #######
win = Tk()   
win.title("Public Library")
scrollbar = Scrollbar(win)
scrollbar.pack(side = RIGHT, fill = Y )
#scrollbar.config(command=tab1.)

tabControl = ttk.Notebook(win)
tab3 = ttk.Frame(tabControl)
tab1 = ttk.Frame(tabControl)
tab2 = ttk.Frame(tabControl)
#tab4 = ttk.Frame(tabControl)

#Set background color
#win.configure(background="#ecebec")

tabControl.add(tab3, text="Main Menu")
tabControl.add(tab1, text="Reader Menu")
#tabControl.add(tab4, text="Reader Menu 2")
tabControl.add(tab2, text="Admin Menu")

tabControl.pack(expand = 1, fill ="both") 

#######################################
##########    MAIN MENU  ############
#######################################
MMlabel10=Label(tab3, text="                         " )
MMlabel10.pack()
MMlabel11=Label(tab3, text="                         " )
MMlabel11.pack()
MMlabel1=Label(tab3, text=" Enter Your Reader Card Number: " )
MMlabel1.pack()
MMSearchQuery_textBox1 = Entry(tab3, width =20 )
MMSearchQuery_textBox1.pack()
MMbtn1=Button (tab3, text="Reader Menu", width =10,height=2 ,command=popupReader)
MMbtn1.pack()
MMlabel12=Label(tab3, text="                         " )
MMlabel12.pack()
MMlabel13=Label(tab3, text="                         " )
MMlabel13.pack()
MMlabel2=Label(tab3, text="Enter Your Admin ID: " )
MMlabel2.pack()
MMSearchQuery_textBox2 = Entry(tab3, width =20 )
MMSearchQuery_textBox2.pack()
MMbtn1=Button (tab3, text="Admin Menu", width =10,height=2 ,command=popupAdmin)
MMbtn1.pack()


#######################################
##########    READER MENU  ############
#######################################

##########    QUERY1  ############
q1label0=Label(tab1, text="###### Document Search ######" )
q1label0.pack()
q1label1=Label(tab1, text="Enter DOCID/Publisher:" )
q1label1.pack()
q1SearchQuery_textBox1 = Entry(tab1, width =20 )
q1SearchQuery_textBox1.pack()
q1label2=Label(tab1, text="Enter Title" )
q1label2.pack()
q1SearchQuery_textBox2 = Entry(tab1, width =20 )
q1SearchQuery_textBox2.pack()
q1btn1=Button (tab1, text="Search Document", width =10,height=2 ,command=searchDocument)
q1btn1.pack()
ttk.Separator(tab1).pack()

##########    QUERY2  ############
q1label8=Label(tab1, text="                         " )
q1label8.pack()
q2label1=Label(tab1, text="###### Document Checkout, Return and Reservation ######" )
q2label1.pack()
q2label2=Label(tab1, text="Enter DOCID" )
q2label2.pack()
q2SearchQuery_textBox1 = Entry(tab1, width =20 )
q2SearchQuery_textBox1.pack()
q2label3=Label(tab1, text="Enter BranchID" )
q2label3.pack()
q2SearchQuery_textBox2 = Entry(tab1, width =20 )
q2SearchQuery_textBox2.pack()
q2label4=Label(tab1, text="Enter CopyNo" )
q2label4.pack()
q2SearchQuery_textBox3 = Entry(tab1, width =20 )
q2SearchQuery_textBox3.pack()
q2label5=Label(tab1, text="Enter ReadID" )
q2label5.pack()
q2SearchQuery_textBox4 = Entry(tab1, width =20 )
q2SearchQuery_textBox4.pack()
q2btn1=Button (tab1, text="Checkout", width =10,height=2 ,command=checkout)
q2btn1.pack()
q2btn2=Button (tab1, text="Return", width =10,height=2 ,command=returnDoc)
q2btn2.pack()
q2btn3=Button (tab1, text="Reserve", width =10,height=2 ,command=reserve)
q2btn3.pack()
ttk.Separator(tab1).pack()

# ##########    QUERY3  ############
# q3label1=Label(tab1, text="###### Publisher Details ######" )
# q3label1.pack()
# q3label2=Label(tab1, text="Enter Publisher ID" )
# q3label2.pack()
# q3SearchQuery_textBox1 = Entry(tab1, width =20 )
# q3SearchQuery_textBox1.pack()
# q3btn1=Button (tab1, text="Get Details", width =10,height=2 ,command=getPub)
# q3btn1.pack()


##########    QUERY3  ############
q1label9=Label(tab1, text="                         " )
q1label9.pack()
q3label1=Label(tab1, text="###### Check Status  ######" )
q3label1.pack()
q3label2=Label(tab1, text="Enter Reader ID" )
q3label2.pack()
q3SearchQuery_textBox1 = Entry(tab1, width =20 )
q3SearchQuery_textBox1.pack()
q3btn1=Button (tab1, text="Get Details", width =10,height=2 ,command=getStatus)
q3btn1.pack()


output1 = Text(tab1, width=75, height=20, wrap=WORD)
output1.pack()




#######################################
##########    ADMIN MENU  ############
#######################################

##########    QUERY1  ############
t2q1label99=Label(tab2, text="                         " )
t2q1label99.pack()
t2q1label0=Label(tab2, text="###### Add a Document Copy ######" )
t2q1label0.pack()
t2q1label1=Label(tab2, text="Enter Title:" )
t2q1label1.pack()
t2q1SearchQuery_textBox1 = Entry(tab2, width =20 )
t2q1SearchQuery_textBox1.pack()
t2q1label2=Label(tab2, text="Enter Published Date in (YYYY-MM-DD) Format Only" )
t2q1label2.pack()
t2q1SearchQuery_textBox2 = Entry(tab2, width =20 )
t2q1SearchQuery_textBox2.pack()
t2q1label3=Label(tab2, text="Enter Published ID" )
t2q1label3.pack()
t2q1SearchQuery_textBox3 = Entry(tab2, width =20 )
t2q1SearchQuery_textBox3.pack()
t2q1btn1=Button (tab2, text="Add Document", width =10,height=2 ,command=addDocument)
t2q1btn1.pack()
ttk.Separator(tab2).pack()

##########    QUERY2  ############
t2q2label99=Label(tab2, text="                         " )
t2q2label99.pack()
t2q2label0=Label(tab2, text="###### Get top N borrowed Books ######" )
t2q2label0.pack()
t2q2label1=Label(tab2, text="Enter N:" )
t2q2label1.pack()
t2q2SearchQuery_textBox1 = Entry(tab2, width =20 )
t2q2SearchQuery_textBox1.pack()
t2q2btn1=Button (tab2, text="Fetch", width =10,height=2 ,command=getNBorrowed)
t2q2btn1.pack()
ttk.Separator(tab2).pack()


##########    QUERY3  ############
t2q3label99=Label(tab2, text="                         " )
t2q3label99.pack()
t2q3label0=Label(tab2, text="###### Average Fines from Each Branch ######" )
t2q3label0.pack()
t2q3label1=Label(tab2, text="Enter Start Date (YYYY-MM-DD format only):" )
t2q3label1.pack()
t2q3SearchQuery_textBox1 = Entry(tab2, width =20 )
t2q3SearchQuery_textBox1.pack()
t2q3label2=Label(tab2, text="Enter End Date (YYYY-MM-DD format only):" )
t2q3label2.pack()
t2q3SearchQuery_textBox2 = Entry(tab2, width =20 )
t2q3SearchQuery_textBox2.pack()
t2q3btn1=Button (tab2, text="Calculate", width =10,height=2 ,command=getAvgFine)
t2q3btn1.pack()
ttk.Separator(tab2).pack()




output2 = Text(tab2, width=75, height=20, wrap=WORD)
output2.pack()
win.mainloop()




