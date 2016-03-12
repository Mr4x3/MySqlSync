#!/usr/bin/python3
#Hardcoded
#Custom Hardcoded Wraapper for sql file created
#this Will exclude some tables which are to be Excluded
#Full Fleged

import MySQLdb
import sys
import re
import datetime
import os
import time
from info import *
import subprocess
r=sys.argv
if len(r)<3:
    print("Usage python3 SupplMySqlSync.py [sourcedb] [destinationdb] \n Source and destination format mysql://username:password:@productionserver:3306/other")
status=subprocess.Popen(["python3",'MySqlSync.py','-a',r[1],r[2]]).communicate()
#status=subprocess.Popen(["python3",'MySqlSync.py -a' {} {}".format(r[1],r[2])]).communicate()
#time.sleep(5)
#source,destination
#mysql://username:password:@productionserver:3306/other
#print("Usage $python3 queryFileTodb.py database.sql host user password database")
z=r[2][r[2].rfind('/')+1:]+'.'+datetime.datetime.now().strftime(DATE_FORMAT)+'.'+"patch.sql"
listOfExcludedTables=['django_','auth_']
buffer=[]
with open(z) as sql:
    for i in sql.readlines():
        if i.startswith("""CREATE TABLE `auth_""") or i.startswith("""CREATE TABLE `django_"""):
            continue
        buffer.append(i)


#Arguments Given as (database.sql, host, user, password, database)
with open("final_patch.sql",'w') as fp:
    fp.write("".join(buffer))
print("Final Patch File Created at {}".format(os.path.join(os.getcwd() + "/final_patch.sql")))
# Open database connection
#db1 = MySQLdb.connect(z[2],z[3],z[4])
#Tupple of (host, user, password, database,)

# prepare a cursor object using cursor() method
#cursor = db1.cursor()

# execute SQL query using execute() method.
#cursor.execute(fullsql)
#k=cursor.fetchall()
#print(k)
# Fetch a single row using fetchone() method.
#data = cursor.fetchone()

# disconnect from server
#db1.close()
