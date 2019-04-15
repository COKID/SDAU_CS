例1：使用下面的查询语句获取数据库实例当前使用的参数文件的类型和位置。
SELECT value, DECODE(value, NULL, 'PFILE', 'SPFILE') "文件类型"
FROM v$parameter WHERE name = 'spfile';

例2：使用SHOW命令获取spfile参数文件的位置信息。
SHOW PARAMETER spfile

例3：使用各个参数视图获取参数信息。
SELECT name, value FROM v$parameter WHERE name = 'nls_length_semantics'; 
SELECT name, value FROM v$system_parameter WHERE name='nls_length_semantics';
ALTER SESSION SET nls_length_semantics = 'CHAR';
SELECT name, value FROM v$parameter WHERE name = 'nls_length_semantics'; 
SELECT name, value FROM v$system_parameter WHERE name='nls_length_semantics';
ALTER SYSTEM SET nls_length_semantics = 'CHAR';
SELECT name, value FROM v$system_parameter WHERE name='nls_length_semantics';
SHUTDOWN IMMEDIATE
STARTUP
SELECT name, value FROM v$parameter WHERE name = 'nls_length_semantics'; 
SELECT name, value FROM v$system_parameter WHERE name='nls_length_semantics';

例4：查询过时参数和强调参数信息。
SELECT kspponm, DECODE(ksppoflg,  1, 'Obsolete',  2,  'Underscored') 
FROM x$ksppo;

例5：创建服务器参数文件和普通参数文件。
CREATE PFILE FROM SPFILE;                   
CREATE PFILE='F:\init.ora' FROM MEMORY;        
CREATE SPFILE='F:\spfile.ora' FROM PFILE='F:\init.ora';
CREATE SPFILE='F:\spfile.ora' FROM MEMORY; 

例6：查看被标识为DEFERRED的初始化参数。
SELECT name, value FROM v$parameter WHERE issys_modifiable='DEFERRED';

例7：使用ALTER SYSTEM SET语句在实例级别修改参数。
ALTER SYSTEM SET sort_area_size=52428800 scope = spfile;
ALTER SYSTEM SET sort_area_size=52428800;

例8：使用ALTER SESSION SET语句在会话级别修改参数。
ALTER SESSION SET recyclebin = off;

例9：使用STARTUP 命令启动数据库。
SHUTDOWN IMMEDIATE                                          
STARTUP  

例10：在STARTUP命令中使用指定的参数文件创建和启动数据库实例。
STARTUP NOMOUNT PFILE=F:\init.ora         
SHUTDOWN IMMEDIATE 
STARTUP NOMOUNT PFILE=F:\spfile.ora 

例11：在STARTUP命令中指定普通参数文件。
STARTUP NOMOUNT PFILE=F:\init.ora

例12：使用ALTER DATABASE切换数据库的启动状态。
SHUTDOWN IMMEDIATE                                                                   
STARTUP NOMOUNT                   
SELECT status FROM v$instance;    
SELECT open_mode FROM v$database; 
SELECT * FROM user_users;         
ALTER DATABASE MOUNT;             
SELECT open_mode FROM v$database; 
SELECT username FROM user_users;  
ALTER DATABASE OPEN;
SELECT username FROM user_users;

例13：将数据库设置为受限状态。
conn scott/tiger
SHUTDOWN IMMEDIATE                   
STARTUP RESTRICT                     
conn scott/tiger                     
conn / as sysdba
GRANT RESTRICTED SESSION TO scott;  
conn scott/tiger

例15：将数据库设置为只读状态。
SQL> SHUTDOWN IMMEDIATE                                           
SQL> STARTUP NOMOUNT                                                                                  
SQL> ALTER DATABASE MOUNT;
SQL> ALTER DATABASE OPEN READ ONLY;                       
SQL> conn learner/learner123
SQL> UPDATE teacher SET t_gender = '男';

例16：设置数据库的静默状态与非静默状态。
--打开SQL*Plus客户端（会话1）
conn / as sysdba;
ALTER SYSTEM QUIESCE RESTRICTED;
SELECT status, active_state FROM v$instance;
ALTER SYSTEM UNQUIESCE;
--打开另一个SQL*Plus客户端（会话2）
conn learner/learner123;
UPDATE teacher SET t_name = 'aa'; 
ROLLBACK;
UPDATE teacher SET t_name = 'aa';
--打开另一个SQL*Plus客户端（会话3）
conn scott/tiger

例17：设置数据库的挂起状态与非挂起状态。
--打开SQL*Plus客户端（会话1）
SQL> conn / as sysdba;
SQL> ALTER SYSTEM SUSPEND;
SQL> SELECT status, database_status FROM v$instance;
SQL> ALTER SYSTEM RESUME;
--打开另一个SQL*Plus客户端（会话2）
SQL> conn learner/learner123;
SQL> UPDATE teacher SET t_name = 'aa'; 
SQL> ROLLBACK;
SQL> UPDATE teacher SET t_name = 'aa';
SQL> ROLLBACK;


例18：使用SHUTDOWN命令数据库的关闭。
--打开SQL*Plus客户端（会话1）
conn / as sysdba;
SHUTDOWN TRANSACTIONAL;
STARTUP;
SHUTDOWN IMMEDIATE;
--打开另一个SQL*Plus客户端（会话2）
conn learner/learner123;
UPDATE teacher SET t_name = 'aa';
ROLLBACK;
UPDATE teacher SET t_name = 'aa';


