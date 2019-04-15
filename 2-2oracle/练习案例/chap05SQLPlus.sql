例1：使用sqlplus –help命令查看sqlplus命令的使用方法。
sqlplus -help

例2：使用sqlplus命令登录SQL*Plus，然后再输入用户名和密码连接数据库。
sqlplus

例3：在sqlplus命令后面指定连接数据库的用户名和密码，然后连接数据库。
sqlplus learner/learner123

例4：使用Oracle10g的SQL*Plus登录到远程的Oracle11g服务器上。
sqlplus learner/learner123@10.1.236.12:1521/myorcl

例5：以数据库管理员的身份登录到数据库中。
sqlplus sys/linDB123 as sysdba

例6：以数据库操作员的身份登录到数据库中。
sqlplus sys/linDB123 as sysoper

例7：省略用户名和密码的数据库管理员登录方法。
sqlplus / as sysdba

例8：当存在多个数据库时，登录到指定的数据库中。
set oracle_sid=orcl1
sqlplus / as sysdba

例9：使用sqlplus命令登录到SQL*Plus，然后再使用connect命令连接Oracle数据库。
sqlplus /nolog
conn / as sysdba

例10：使用HELP INDEX命令获取SQL*Plus支持的命令信息。
HELP INDEX

例11：使用HELP CONNECT的方法获取CONNECT命令具体的使用方法。
HELP CONNECT

例12：使用? CONNECT的方法获取CONNECT命令具体的使用方法。
? CONNECT

例13：下面的查询语句查询了V_$PARAMETER视图的定义，如果不使用SET LONG命令设置text列的显示长度则不能完全显示该列的内容。
SET LONG 1000
SELECT text FROM dba_views WHERE view_name = 'V_$PARAMETER';

例14：使用SET ECHO命令设置是否显示脚本文件中命令。
SHOW ECHO
SELECT username FROM dba_users WHERE rownum < 3;
save c:\test.sql
@c:\test.sql
SET ECHO ON
@c:\test.sql
SELECT username FROM dba_users WHERE rownum < 3
/

例15：使用SET FEEDBACK命令设置是否显示SQL语句执行的结果信息。
SHOW FEEDBACK
SELECT paper_id, paper_title FROM paper WHERE rownum <= 5;
SELECT paper_id, paper_title FROM paper WHERE rownum <= 6;
CREATE TABLE test(id NUMBER(6));
SET FEEDBACK 0
CREATE TABLE test(id NUMBER(6));

例16：使用SET HEADING命令设置不显示表头信息。
SET HEADING OFF;
SELECT s_id, s_name, s_gender, s_nation, s_political FROM student;

例17：使用SET NUMFORMAT命令设置数字的显示风格。
SET NUMFORMAT $9,999,999,999
SELECT 12345678 n1, 1234.5678 n2, 1234.5678 n3 FROM dual;

例18：使用SET TIME命令设置是否显示系统时间。
SET TIME ON
SHOW ARRAYSIZE

例19：使用SET TIMING命令设置是否显示SQL语句执行时间。
SET TIMING ON
SELECT COUNT(*) FROM dba_objects;

例20：使用SET PAUSE命令设置是否缓冲显示查询结果。
SET PAUSE ON
SET PAUSE '请按回车键查看下一页记录'
SELECT s_id, s_name, s_classname FROM student;

例21：使用SHOW PARAMETERS命令获取参数文件中参数名包含“undo”的参数信息。
SHOW PARAMETERS undo

例22：使用SHOW SGA命令查看当前实例的系统全局区的信息。
SHOW SGA

例23：使用SHOW USER命令查看当前连接SQL*Plus的用户的名称。
SHOW USER

例24：使用SHOW RECYCLEBIN命令和user_recyclebin视图查看回收站中的对象。
CREATE TABLE testrecyc(id NUMBER, name VARCHAR2(20));
DROP TABLE testrecyc;
SHOW RECYCLEBIN;    --结果只包含表
SELECT original_name, object_name, type, droptime FROM user_recyclebin;

例25：查看recyclebin参数的当前值。
SHOW PARAMETER recyclebin

例26：在会话级别禁用或启用回收站。
CREATE TABLE testrecyc(id NUMBER PRIMARY KEY, name VARCHAR2(20));
ALTER SESSION SET recyclebin = OFF;   
DROP TABLE testrecyc;
SELECT original_name, object_name, type , droptime FROM user_recyclebin;

例27：使用 PROMPT命令设置提示信息。
prompt
prompt 选择教师表中的前2行记录
prompt
SELECT t_id, t_name, t_gender FROM teacher WHERE rownum < 3
/

例28：使用 SAVE命令保存缓冲区中的SQL语句。
SELECT t_id, t_name, t_gender FROM teacher WHERE rownum < 3;
SAVE c:\query1.sql

例29：使用 @命令执行例6.24创建的query1.sql中的SQL语句。
@c:\query1.sql

例30：使用EDIT命令在记事本中编辑SQL语句。
SELECT t_id, t_name, t_gender FROM teacher WHERE rownum < 3;
ed
/

例31：使用RUN命令执行缓冲区中的SQL语句。
R

例32：使用COLUMN命令对显示结果进行格式化。
COL n1 FORMAT $9,999,999,999
COL n2 FORMAT 9999.999
COL n3 FORMAT 999.999
SELECT 12345678 n1, 1234.5678 n2, 1234.5678 n3 FROM dual;

例33：使用COLUMN命令定义表头。
COL n1 FORMAT $9,999,999,999 HEADING 总金额
COL n2 HEADING 第二个数
SELECT 12345678 n1, 1234.5678 n2, 1234.5678 n3 FROM dual;

例34：使用DESC命令查看学生表的结构。
DESC student

例35：从教师表中把所有教师的信息查询出来并输出到文本文件d:\teacher.txt中。
SPOOL D:\teacher.txt
SELECT t_id, t_name , t_duty, t_research FROM teacher;
SPOOL OFF

例36：利用SPOOL命令生成删除某用户下面所有表的SQL脚本。
SPOOL C:\drop_tables.sql
SELECT 'DROP TABLE '|| table_name ||';' AS ALLTABLES FROM user_tables;
SPOOL OFF

例37：清除例32设置的列显示格式。
CLEAR COLUMNS
SELECT 12345678 n1, 1234.5678 n2, 1234.5678 n3 FROM dual;

例38：使用 login.sql设置用户的环境变量。
--以下是glogin.sql的部分内容
SET LONG 500
SET LINESIZE 10
--以下是login.sql的部分内容
SET LINESIZE 50






