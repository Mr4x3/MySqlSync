# MySqlSync Version 0.1*
Package to compare and generate query file Needed to add, diffrence
in schema, between two server development database and local database.

Usages:
>>python3 MySqlSync.py [options] <source> <target>

>>source/target format: mysql://user:pass@host:port/database

Examples:
***********************************************************************
>> python3.4 MySqlSync.py mysql://username:password@developmentserver:3306/local mysql://username:password:@productionserver:3306/other
************************************************************************
>> ./MySqlSync.py mysql://username:password@developmentserver:3306/local mysql://username:password:@productionserver:3306/other
*************************************************************************

The resulting file will generate a new sql query file to use at production server so that it may be imported
**************************************************************************************************************


Credits
For creating schemaobject package by which database can be interacted using python
***********************schemaobject package which was created for python 2.3 or python2 is now ported to python3**************

http://matuson.com/code/schemaobject
https://pypi.python.org/pypi/SchemaObject
- [x] Added support for python3
- [x] Test on 2 databases
- [x] Documentation
- [ ] Problem with foreignkey
- [ ] Create Revert Back changes
- [ ] Create For 2 Diffrent files
- [ ] Add Support for Excluded tables
- [x] HardCoded Above
