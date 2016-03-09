#!/usr/bin/python3
#Hardcoded
#Custom Hardcoded Wraapper for sql file created
#this Will exclude some tables which are to be Excluded

import MySQLdb
import sys
import re

r=sys.argv
status=os.popen('python3 {} {} {}'.format(r[1],r[2]))
#source,destination
print("Usage $python3 queryFileTodb.py database.sql host user password database")
z= sys.argv
listOfExcludedTables=['django_','auth_']
buffer=[]
with open(z[1]) as sql:
    for i in sql.readlines():
        if i.startswith("""CREATE TABLE `auth_""") or i.startswith("""CREATE TABLE `django_"""):
            continue
        buffer.append(i)


#Arguments Given as (database.sql, host, user, password, database)
with open("final_patch.sql",'w') as fp:
    fp.write("".join(buffer))
print(z)
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
