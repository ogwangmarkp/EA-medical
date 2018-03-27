# -*- coding: utf-8 -*-
"""
Created on Fri Aug 25 12:29:02 2017

@author: SourceQode
"""

import pymysql

db= None

def getConnection():
 # Open database connection
        global db
        try:
         db = pymysql.connect("localhost","root","","nasuuti_db" )
         return True
        except:
         return False
        
        
    
def fetchData(sqlString):
        # prepare a cursor object using cursor() method
        cursor = db.cursor()
        try:
            
        # execute SQL query using execute() method.
            cursor.execute(sqlString)
        # Fetch a single row using fetchone() method.
       # data = cursor.fetchone()
        except:  
         print("Error: unable to fetch data")
         return None
         
        finally:
            # disconnect from server
            db.close()
            
        return cursor
        
def insert_UpdateData(sqlString):
        # prepare a cursor object using cursor() method
        cursor = db.cursor()
         # Commit your changes in the database
        db.commit()
        try:
            # execute SQL query using execute() method.
            cursor.execute(sqlString)
            return True
        except:
             # Rollback in case there is any error
            db.rollback()
            return False
            
        
        
        # disconnect from server
        db.close()
def deleteData(sqlString):
     # prepare a cursor object using cursor() method
        cursor = db.cursor()
         # Commit your changes in the database
        db.commit()
        try:
            # execute SQL query using execute() method.
            cursor.execute(sqlString)
            return True
        except:
             # Rollback in case there is any error
            db.rollback()
            return False
        
        # disconnect from server
def closeDb():
    if(getConnection):
        db.close()
    else:
        print("there was no connection")
    