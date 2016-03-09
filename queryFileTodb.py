#!/usr/bin/python3

#Feed a sql as a schema and there will be updates in given databse

import MySQLdb
import sys
print("Usage $python3 queryFileTodb.py database.sql host user password database")
z= sys.argv
#Arguments Given as (database.sql, host, user, password, database)
with open(z[1], 'r') as input:
    fullsql = input.read()
print(z)
# Open database connection
db1 = MySQLdb.connect(z[2],z[3],z[4])
#Tupple of (host, user, password, database,)

# prepare a cursor object using cursor() method
cursor = db1.cursor()

# execute SQL query using execute() method.
cursor.execute(fullsql)
k=cursor.fetchall()
print(k)
# Fetch a single row using fetchone() method.
data = cursor.fetchone()

# disconnect from server
db1.close()
