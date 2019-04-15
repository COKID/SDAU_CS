例1：为教师表设置不同的默认缓冲池。
SELECT table_name, buffer_pool FROM user_tables WHERE table_name = 'TEACHER';
ALTER TABLE teacher STORAGE (BUFFER_POOL KEEP);  
SELECT table_name, buffer_pool FROM user_tables WHERE table_name = 'TEACHER';
ALTER TABLE teacher STORAGE (BUFFER_POOL RECYCLE);  
SELECT table_name, buffer_pool FROM user_tables WHERE table_name = 'TEACHER';
ALTER TABLE teacher STORAGE (BUFFER_POOL DEFAULT);

例2：为教师表设置缓存方式。
SELECT table_name, buffer_pool, cache FROM user_tables WHERE table_name = 'TEACHER';
ALTER TABLE teacher CACHE;        
SELECT table_name, buffer_pool, cache FROM user_tables WHERE table_name = 'TEACHER';

例3：创建日志文件组4，该组包括2个联机日志文件。
ALTER DATABASE ADD LOGFILE GROUP 4 ('D:\BACKUP\REDO041.LOG', 'D:\BACKUP\REDO042.LOG') SIZE 8M;

例4：不指定日志文件组的组号，创建日志文件组5，该组包括2个联机日志文件。
ALTER DATABASE ADD LOGFILE ('D:\BACKUP\REDO051.LOG', 'D:\BACKUP\REDO052.LOG') SIZE 8M;

例5：向日志文件组3和日志文件组4添加了日志文件。
ALTER DATABASE ADD LOGFILE MEMBER 'D:\BACKUP\REDO032.LOG' TO GROUP 3, 'D:\BACKUP\REDO043.LOG' TO GROUP 4;
SELECT * FROM v$logfile;

例6：不指定日志文件组的组号向日志文件组5中添加日志文件。
ALTER DATABASE ADD LOGFILE MEMBER 'D:\BACKUP\REDO053.LOG' TO ('D:\BACKUP\REDO051.LOG', 'D:\BACKUP\REDO052.LOG');

例7：删除日志文件。
ALTER DATABASE DROP LOGFILE MEMBER 'D:\BACKUP\REDO032.LOG';
SELECT group# from v$log WHERE status = 'CURRENT';

例8：删除日志文件组。
ALTER DATABASE DROP LOGFILE GROUP 6;
ALTER DATABASE DROP LOGFILE GROUP 5;

例9：清空日志文件组。
ALTER DATABASE CLEAR LOGFILE GROUP 4;   
ALTER SYSTEM SWITCH LOGFILE;
SELECT group#, status FROM v$log;
ALTER DATABASE CLEAR LOGFILE GROUP 1; 
ALTER DATABASE CLEAR UNARCHIVED LOGFILE GROUP 1;

例10：查询学生表使用的数据段的信息和教师表属于哪个数据文件。
SELECT segment_name, segment_type, tablespace_name, bytes, blocks, extents FROM user_segments WHERE SEGMENT_NAME = 'STUDENT';
SELECT file_name, file_id FROM dba_data_files WHERE file_id IN (SELECT DISTINCT file_id FROM dba_extents WHERE segment_name='TEACHER');

例11：创建表空间test1，数据文件在默认目录下，大小是100M，其余选项都为默认值。
CREATE TABLESPACE test1 DATAFILE 'test1.dbf' SIZE 100M; 
SELECT tablespace_name, file_name FROM dba_data_files; 
SELECT name FROM v$datafile;

例12：创建表空间test2，该表空间中有3个数据文件，大小分别是70M、80M、90M，其余选项都为默认值。
CREATE TABLESPACE test2 DATAFILE 'D:\test21.dbf' SIZE 70M,'D:\test22.dbf' SIZE 80M, 'D:\test23.dbf' SIZE 90M;

例13：创建表空间test3，该表空间中有1个数据文件，大小是100M，当数据文件被占满时可以自动扩大10M的空间，但数据文件的最大空间为300M，禁用生成日志的功能，区采用统一分配的方式，区默认大小为1M，其余选项都为默认值。
CREATE TABLESPACE test3 DATAFILE 'D:\test3.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 300M
NOLOGGING
EXTENT MANAGEMENT LOCAL UNIFORM;

例14：创建临时表空间temp1，其临时数据文件的大小为20M，其余选项都为默认值。
CREATE TEMPORARY TABLESPACE temp1 TEMPFILE 'D:\TEMP\temp1.dbf' SIZE 20M;
SELECT tablespace_name, file_name FROM dba_temp_files;  
SELECT name FROM v$tempfile;

例15：创建临时表空间temp2，包含2个大小分别是10M和20M的临时数据文件，第一个临时数据文件被占满时可以自动扩大2M的空间且最大空间为100M，第二个临时数据文件被占满时可以自动扩大10M的空间且最大空间为300M，区采用统一分配的方式，区大小为512K。
CREATE TEMPORARY TABLESPACE temp2
TEMPFILE 'D:\TEMP\temp21.dbf' SIZE 10M AUTOEXTEND ON NEXT 2M MAXSIZE 100M,
'D:\TEMP\temp22.dbf' SIZE 20M AUTOEXTEND ON NEXT 10M MAXSIZE 300M
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 512K;

例16：创建撤销表空间undo1，包含2个大小都是20M的数据文件，当第二个数据文件被占满时可以自动扩大10M的空间且最大空间为300M，区采用自动分配的方式。
CREATE UNDO TABLESPACE undo1
DATAFILE 'D:\UNDO\undo11.dbf' SIZE 20M, 
'D:\UNDO\undo12.dbf' SIZE 20M AUTOEXTEND ON NEXT 10M MAXSIZE 300M;

例17：将test1表空间设置为脱机状态，然后将其设置会联机状态。
ALTER TABLESPACE test1 OFFLINE;    
ALTER TABLESPACE test1 ONLINE;

例18：将test1表空间设置为只读状态，然后将其设置会可读写状态。
ALTER TABLESPACE test1 READ ONLY;    
ALTER TABLESPACE test1 READ WRITE;

例19：将数据库的默认临时表空间设置为temp1，默认永久表空间设置为test1，将用户scott的临时表空间设置为temp2。
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE temp1;     
ALTER DATABASE DEFAULT TABLESPACE test1;            
ALTER USER scott TEMPORARY TABLESPACE temp2;

例20：将表空间temp1的名称改为rtest。
ALTER TABLESPACE test1 RENAME TO rtest;

例21：将表空间temp2的大小收缩为10M。
SELECT bytes/1024/1024 Mbytes, blocks, maxbytes/1024/1024 MmaxBytes,maxblocks FROM dba_temp_files WHERE tablespace_name = 'TEMP2';
ALTER TABLESPACE temp1 SHRINK SPACE KEEP 10M;
SELECT bytes/1024/1024 Mbytes, blocks, maxbytes/1024/1024 MmaxBytes, maxblocks FROM dba_temp_files WHERE tablespace_name = 'TEMP2';

例22：删除表空间test3，但不删除数据文件，因此该数据文件可以被重用。
DROP TABLESPACE test3;  
CREATE TABLESPACE test3 DATAFILE 'D:\test3.dbf' SIZE 100M;
CREATE TABLESPACE test3 DATAFILE 'D:\test3.dbf' SIZE 100M REUSE;
CREATE TABLE test(id NUMBER, name varchar2(10)) TABLESPACE test3;
DROP TABLESPACE test3;
DROP TABLESPACE test3 INCLUDING CONTENTS AND DATAFILES;

例23：删除临时表空间temp1。
ROP TABLESPACE temp1;
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE temp;
DROP TABLESPACE temp1;

例24：为表空间test2添加一个数据文件，数据文件大小为10M，自动扩展且最大空间无限制。为表空间temp2添加两个大小分别为30M和40M的临时数据文件。为表空间undo1添加一个30M的数据文件。
ALTER TABLESPACE test2 ADD DATAFILE 'test22.dbf' SIZE 10M AUTOEXTEND ON MAXSIZE UNLIMITED;
ALTER TABLESPACE temp2 ADD TEMPFILE 'D:\TEMP\temp23.dbf' SIZE 30M, 'D:\TEMP\temp24.dbf' SIZE 40M;
ALTER TABLESPACE undo1 ADD DATAFILE 'D:\UNDO\undo13.dbf' SIZE 30M;


例25：删除test2表空间的数据文件test22.dbf，删除temp2表空间的临时数据文件temp23.dbf，通过文件编号删除undo1表空间的数据文件undo13.dbf。
ALTER TABLESPACE test2 DROP DATAFILE 'test22.dbf';    
ALTER TABLESPACE temp2 DROP TEMPFILE 'D:\TEMP\temp23.dbf';
SELECT file_name,file_id FROM dba_data_files WHERE TABLESPACE_NAME = 'UNDO1';
ALTER TABLESPACE undo1 DROP DATAFILE 14; 

例26：增加临时文件temp24.dbf的大小至150M，然后再将其设置为自动扩展方式，每次扩展5M，大小没有上限。
ALTER DATABASE TEMPFILE 'D:\TEMP\temp24.dbf' RESIZE 150M;  
ALTER DATABASE TEMPFILE 'D:\TEMP\temp24.dbf' AUTOEXTEND ON NEXT 5M MAXSIZE UNLIMITED;

例27：将数据文件test22.dbf、临时数据文件temp24.dbf设置为脱机状态。
ARCHIVE LOG LIST
ALTER DATABASE DATAFILE 'D:\test22.dbf' OFFLINE;
ALTER DATABASE DATAFILE 'D:\test22.dbf' OFFLINE FOR DROP;    
ALTER DATABASE TEMPFILE 'D:\TEMP\temp24.dbf' OFFLINE;
ALTER DATABASE TEMPFILE 'D:\TEMP\temp24.dbf' ONLINE;
ALTER DATABASE DATAFILE 'D:\test22.dbf' ONLINE;
ALTER DATABASE RECOVER DATAFILE 'D:\test22.dbf';
ALTER DATABASE DATAFILE 'D:\test22.dbf' ONLINE;

例28：查看表空间的使用信息。
SELECT dbf.tablespace_name,
dbf.totalspace "总量(M)",
dbf.totalblocks as 总块数,
dfs.freespace "剩余总量(M)",
dfs.freeblocks "剩余块数",
(dfs.freespace/dbf.totalspace)*100 "空闲比例"
FROM (SELECT t.tablespace_name,
SUM(t.bytes)/1024/1024 totalspace,
SUM(t.blocks) totalblocks
FROM dba_data_files t
GROUP BY t.tablespace_name) dbf,
(SELECT tt.tablespace_name,
SUM(tt.bytes)/1024/1024 freespace,
SUM(tt.blocks) freeblocks
FROM dba_free_space tt
GROUP BY tt.tablespace_name) dfs
WHERE TRIM(dbf.tablespace_name) = TRIM(dfs.tablespace_name);

