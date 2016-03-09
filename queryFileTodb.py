#!/usr/bin/python

import MySQLdb

# Open database connection
db1 = MySQLdb.connect("localhost","root","toor","other" )
#Tupple of (host, user, password, database,)

# prepare a cursor object using cursor() method
cursor = db1.cursor()

# execute SQL query using execute() method.
cursor.execute("show tables")
k=cursor.fetchall()
print(k)
# Fetch a single row using fetchone() method.
data = cursor.fetchone()

# disconnect from server
db1.close()
