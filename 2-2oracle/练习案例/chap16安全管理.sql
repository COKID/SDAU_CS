例1：以scott用户的身份访问learner模式的教师表。
conn scott/tiger                                                    
SELECT t_id, t_name, t_research FROM learner.teacher;        
conn learner/learner123
GRANT SELECT ON teacher TO scott;       --将对教师表的查询权限授予用户scott
conn scott/tiger                                                    
SELECT t_id, t_name, t_research FROM learner.teacher;     
 
例2：创建2个新用户user1和user2。
conn scott/tiger                      
CREATE USER user1 IDENTIFIED BY 123;  
conn / as sysdba                      
CREATE USER user1 IDENTIFIED BY 123;
SELECT property_name, property_value FROM database_properties
WHERE property_name IN('DEFAULT_TEMP_TABLESPACE', 'DEFAULT_PERMANENT_TABLESPACE');
SELECT default_tablespace, temporary_tablespace FROM dba_users 
WHERE username = 'USER1';
CREATE TABLESPACE test DATAFILE 'test.dbf' SIZE 10M;     
CREATE TEMPORARY TABLESPACE test_temp TEMPFILE 'test_temp.dbf' SIZE 10M; 
CREATE USER user2 IDENTIFIED BY 123
DEFAULT TABLESPACE test TEMPORARY TABLESPACE test_temp
QUOTA UNLIMITED ON test;
SELECT default_tablespace, temporary_tablespace FROM dba_users 
SELECT username, tablespace_name, max_bytes 
FROM dba_ts_quotas WHERE USERNAME = 'USER1' OR USERNAME = 'USER2'; 

例3：为本地普通数据库用户进行操作系统认证的设置方法和步骤。这里假设操作系统的用户名为user_os。
CREATE USER "WWW-19B4B6E899F\USER_OS" IDENTIFIED EXTERNALLY; 
GRANT CREATE SESSION TO "WWW-19B4B6E899F\USER_OS";    
SELECT username, password, account_status FROM dba_users 
WHERE username LIKE '%USER_OS%';     
SHOW PARAMETER os_authent_prefix
ALTER SYSTEM SET os_authent_prefix = '' SCOPE=SPFILE;   
SHUTDOWN IMMEDIATE                                           
STARTUP
C:\Users\user_os.WWW-19B4B6E899F>sqlplus /

例4：为远程普通数据库用户进行操作系统认证的设置方法和步骤。假设远程操作系统的用户名为user_os1。
SQL> CREATE USER user_os1 IDENTIFIED EXTERNALLY; 
SQL> GRANT CREATE SESSION TO user_os1;     
SQL> SELECT username, password, account_status FROM dba_users WHERE username = 'USER_OS1';
SQL> SHOW PARAMETER remote_os_authent
SQL> ALTER SYSTEM SET remote_os_authent = true SCOPE=SPFILE;
SQL> SHUTDOWN IMMEDIATE
SQL> STARTUP
C:\Documents and Settings\user_os1>sqlplus /@192.168.1.66/orcl

例5：禁用操作系统认证，改用口令认证方式对特权用户进行合法性验证的设置方法和步骤。
C:\Users\Administrator>sqlplus / as sysdba       
C:\Users\Administrator>sqlplus sys/linDB123 as sysdba 

例6：对2个参数进行设置，使只有SYS用户都能登录且只能使用口令认证方式登录。
ALTER SYSTEM SET remote_login_passwordfile = shared SCOPE = SPFILE;
conn sys/linDB123 as sysdba
STARTUP
SHOW PARAMETER remote_login_passwordfile
GRANT sysdba TO scott;     
SELECT username, sysdba, sysoper FROM v$pwfile_users;
conn user1/123 as sysdba
ALTER USER user1 IDENTIFIED BY 1;

例7：使用ALTER USER语句修改用户user1。
conn / as sysdba
ALTER USER user1 ACCOUNT LOCK;    
conn user1/123                    
conn / as sysdba
ALTER USER user1 PASSWORD EXPIRE ACCOUNT UNLOCK;   
conn user1/123
conn / as sysdba
ALTER USER user1 DEFAULT TABLESPACE test;  
SELECT default_tablespace, temporary_tablespace FROM dba_users 
WHERE username = 'USER1';

例8：将用户user2在表空间test上的配额由无限制改为5M。
ALTER USER user2 QUOTA 5M ON test;

例9：删除当前已经登录到数据库中的用户user2。
DROP USER user2;              
SELECT sid, serial#, username FROM v$session WHERE username = 'USER2';
ALTER SYSTEM KILL SESSION '22, 17';
DROP USER user2;

例10：分别使用user_users、all_users和dba_users视图查询用户的信息。
SELECT USERNAME, USER_ID, ACCOUNT_STATUS, EXPIRY_DATE FROM user_users;           
SELECT * FROM all_users;                        
SELECT * FROM dba_users;
GRANT SELECT ANY DICTIONARY TO user1;  
SELECT * FROM dba_users;

例11：为数据库中的每位用户都授予创建角色和创建视图的权限。
GRANT CREATE ROLE, CREATE VIEW TO PUBLIC;
SELECT * FROM dba_sys_privs WHERE grantee = 'PUBLIC';

例12：将查询任何模式中表的权限授予用户user1，并允许获得权限后授予其他用户。
conn user1/123
SELECT t_id, t_name, t_research FROM learner.teacher;
conn / as sysdba
GRANT SELECT ANY TABLE TO user1 WITH ADMIN OPTION;
conn user1/123
SELECT t_id, t_name, t_research FROM learner.teacher;
GRANT SELECT ANY TABLE TO user2 WITH ADMIN OPTION;
conn user2/123
GRANT SELECT ANY TABLE TO user3; 

例13：回收授予PUBLIC用户组的CREATE ROLE和CREATE VIEW的系统权限。
REVOKE CREATE ROLE, CREATE VIEW FROM PUBLIC;
SELECT * FROM dba_sys_privs WHERE grantee = 'PUBLIC';

例14：回收直接授予和间接授予的权限。
conn user1/123
REVOKE SELECT ANY TABLE FROM user2;          
conn user3/123
SELECT t_id, t_name, t_research FROM learner.teacher;
conn user1/123
REVOKE SELECT ANY TABLE FROM user3;    
conn user3/123
SELECT t_id, t_name, t_research FROM learner.teacher;

例15：使用user_sys_privs和dba_sys_privs视图查询用户的系统权限信息。
SELECT * FROM user_sys_privs;               
SELECT * FROM dba_sys_privs WHERE grantee = 'USER1' OR grantee = 'LEARNER';

例16：使用session_privs视图查询当前用户所拥有的全部系统权限。
SELECT * FROM session_privs;

例17：以用户learner的身份登录到数据库中，为用户user2授予查询学生表、删除学生表和更新t_id、t_name和t_research列的对象权限。
GRANT SELECT, UPDATE(t_id, t_name, t_research),DELETE ON learner.teacher TO user2;     

例18：接上例，将用户user2对learner模式的学生表的查询权限授予用户user3。
conn user2/123
GRANT SELECT ON learner.student TO user3;
conn learner/learner123
GRANT SELECT ON learner.student TO user2 WITH GRANT OPTION;
conn user2/123
GRANT SELECT ON learner.student TO user3;

例19：给PUBLIC用户组授予查询learner模式下的课程表的对象权限。
GRANT SELECT ON learner.course TO PUBLIC;

例20：以用户learner登录数据库，回收授予PUBLIC用户组的查询learner模式的课程表的对象权限。
REVOKE SELECT ON learner.course FROM PUBLIC;
conn user3/123
SELECT * FROM learner.course;

例21：以用户learner登录数据库，回收授予用户user2的更新learner模式的教师表的对象权限。
REVOKE UPDATE ON learner.teacher FROM user2; 

例22：使用user_tab_privs、dba_tab_privs和user_col_privs视图查看对象权限。
SELECT * FROM user_tab_privs;
SELECT * FROM dba_tab_privs WHERE grantee = 'PUBLIC' and grantor = 'LEARNER';
SELECT * FROM user_col_privs;

例23：以用户learner的身份登录数据库，创建3个角色，分别用于管理学生信息和教师信息。
CREATE ROLE s_man1;          
CREATE ROLE s_man2;          
CREATE ROLE t_man IDENTIFIED BY tea;

例子24：创建一个外部角色exter_role，并将DBA角色授予exter_role。
conn scott/tiger
SELECT * FROM user_role_privs;
ALTER SYSTEM SET os_roles = true SCOPE = SPFILE;
SHUTDOWN IMMEDIATE
STARTUP
CREATE ROLE exterrole IDENTIFIED EXTERNALLY;  
GRANT DBA TO exterrole WITH ADMIN OPTION;

例25：为角色s_man1授予learner模式的学生表的查询权限和在任何模式下创建视图、删除视图的系统权限。为角色s_man2授予learner模式的学生表插入、更新和删除权限，为角色t_man授予learner模式的教师表的查询、插入、更新和删除权限。
GRANT SELECT ON learner.student TO s_man1;        
GRANT CREATE ANY VIEW, DROP ANY VIEW TO s_man1;  
GRANT INSERT, UPDATE, DELETE ON learner.student TO s_man2; 
GRANT SELECT, INSERT, UPDATE, DELETE ON learner.teacher TO t_man;

例26：为用户user2授予s_man1角色和t_man角色的权限。为角色t_man授予s_man2角色的权限，然后再将角色t_man授予用户user3。
GRANT s_man1, t_man TO user2;
GRANT s_man2 TO t_man;
GRANT t_man TO user3;

例27：使用ALTER USER为用户user2设置默认角色。
ALTER USER user2 DEFAULT ROLE NONE;  
ALTER USER user2 DEFAULT ROLE ALL EXCEPT s_man1;  
ALTER USER user2 DEFAULT ROLE ALL;  
ALTER USER user2 DEFAULT ROLE s_man1;  
conn user2/123
DELETE FROM learner.student WHERE s_id = '0807070326';
ALTER USER user2 DEFAULT ROLE s_man1, s_man2;
conn user2/123
DELETE FROM learner.student WHERE s_id = '0807070326';

例28：使用SET ROLE语句启用禁用角色。
GRANT t_man TO user2;      
conn user2/123
SELECT t_id, t_name, t_research, t_university FROM learner.teacher;
SET ROLE t_man;  
SET ROLE t_man IDENTIFIED BY tea;    
SELECT t_id, t_name, t_research, t_university FROM learner.teacher;
SET ROLE ALL;     
SET ROLE ALL EXCEPT t_man;       
SET ROLE NONE;                   
SET ROLE t_man identified by tea, s_man2;

例29：回收授予角色的权限。
REVOKE CREATE ANY VIEW, DROP ANY VIEW FROM s_man1; 
REVOKE INSERT, DELETE ON learner.student FROM s_man2;  

例30：从用户user3回收t_man角色。
REVOKE t_man FROM user3;

例31：删除角色s_man1。
DROP ROLE s_man1;

例32：使用各个视图了解角色相关信息。
SELECT * FROM user_role_privs;          
SELECT * FROM session_roles;       
SELECT * FROM role_role_privs;

例33：创建一个概要文件，要求对用户在会话中占用CPU的时间没有限制，但每次调用SQL语句可以占用的CPU时间为10秒，每个会话最长的连接时间为20分钟，连接期间每个会话的最长空闲时间为5分钟，每个用户最多可同时创建5个并发会话，如果该用户连续3次密码输入错误，则锁定该用户，锁定时间为3天。
CREATE PROFILE myprofile LIMIT
CPU_PER_SESSION unlimited
CPU_PER_CALL 1000
CONNECT_TIME 20
IDLE_TIME 5
SESSIONS_PER_USER 5
FAILED_LOGIN_ATTEMPTS 3
PASSWORD_LOCK_TIME 3;

例34：修改概要文件myprofile，要求对用户在会话中占用CPU的时间限制为100秒，每个会话最长的连接时间为30分钟，每个用户最多可同时创建10个并发会话。
ALTER PROFILE myprofile LIMIT
CPU_PER_SESSION 10000
CPU_PER_CALL 1000
CONNECT_TIME 30
SESSIONS_PER_USER 10;

例35：使用CREATE USER语句和ALTER USER语句为用户分配概要文件。
CREATE USER user4 IDENTIFIED BY 123 PROFILE myprofile;   
ALTER USER user3 PROFILE myprofile;  
ALTER USER user4 PROFILE DEFAULT;

例36：修改参数resource_limit的值为true，使概要文件的资源限制参数生效。
SHOW PARAMETER resource_limit
ALTER SYSTEM SET resource_limit = true SCOPE = SPFILE;
SHUTDOWN IMMEDIATE
STARTUP

例37：删除概要文件。
DROP PROFILE myprofile; 
DROP PROFILE myprofile CASCADE;

例38：查看概要文件信息。
SELECT username, profile FROM dba_users;       
SELECT * FROM dba_profiles WHERE profile = 'DEFAULT'; --查询默认概要文件 
SELECT * FROM user_password_limits;
SELECT * FROM user_resource_limits;










