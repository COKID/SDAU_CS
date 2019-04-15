例1：使用ASCII函数获取几个字符的ASCII码的值。
SELECT ASCII('a'),ASCII('A'),ASCII('1'),ASCII('9'),ASCII('中'),ASCII('国')

例2：使用CHR函数获取给定ASCII值所对应的字符。
SELECT CHR(97), CHR(65), CHR(49), CHR(57), CHR(54992), CHR(47610)
FROM dual;

例3：查询期刊表中所有期刊的名称，并将期刊名与期刊等级连接起来。
SELECT CONCAT(CONCAT(journal_name, ' is '),journal_level) AS journal_level
FROM journal;

例4：查询期刊表中所有期刊的名称，并将英文期刊的名称全部以大写的方式返回。
SELECT INITCAP(journal_name) FROM journal;

例5：在字符串“Information Systems Research”中寻找字符“i”第一次出现的位置。
SELECT INSTR('Information Systems Research', 'i') FROM dual;

例6：在字符串“Information Systems Research”中寻找字符“s”第二次出现的位置，条件是从第16位字符开始寻找。
SELECT INSTR('Information Systems Research', 's', 16, 2) FROM dual;

例7：查询期刊表中所有期刊名中包含“INFORMATION”的期刊。
SELECT journal_name FROM journal
WHERE INSTR(journal_name, UPPER('infor')) > 0;

例8：使用INSTR函数实现例7.22的查询功能。
SELECT s_id, s_name, s_nation, s_political, s_classname FROM student
WHERE INSTR(s_political, '党员') > 0;

例9：查询期刊表中所有期刊的名称，并将英文期刊的名称全部以小写的方式返回。
SELECT LOWER(journal_name), journal_level FROM journal;

例10：查询期刊表中所有期刊的名称，并将英文期刊的名称全部以大写的方式返回。
SELECT UPPER(journal_name), journal_level FROM journal;

例11：分别用0将教师编号左、右补齐10位。
SELECT LPAD(t_id, 10, '0'),RPAD(t_id, 10, '0') FROM teacher;

例12：使用LTRIM函数截取空格和字符。
SELECT LENGTH(LTRIM(' oracle  ')), LENGTH(LTRIM(' oracle  ', ' ')) FROM dual;

例13：使用RTRIM函数截取空格和字符。
SELECT LENGTH(RTRIM(' oracle  ')), LENGTH(RTRIM(' oracle  ', ' ')) FROM dual;

例14：使用TRIM函数截取空格和字符。
SELECT TRIM(LEADING '*' FROM '**oracle*') c1, TRIM(TRAILING '*' FROM
'**oracle*') c2, TRIM(BOTH '*' FROM '**oracle*') c3, TRIM('*' FROM
'**ora*cle*') c4, LENGTH(TRIM('  oracle ')) c5 FROM dual;

例15：使用LENGTH函数和LENGTHB函数分别计算英文字符串和中文字符串的长度。
SELECT LENGTH('oracle'), LENGTHB('oracle'),
LENGTH('数据库'), LENGTHB('数据库') FROM dual;

例16：使用 “Oracle数据库”替代“学习数据库”中的“数据库”。
SELECT REPLACE('学习数据库', '数据库', 'Oracle数据库') FROM dual;

例17：使用SUBSTR函数和SUBSTRB函数分别获取英文字符串和中文字符串的子串。
SELECT SUBSTR('oracle', 1, 3) c1, SUBSTRB('oracle', 1, 3) c2,
SUBSTR('学习数据库', 1, 3) c3, SUBSTRB('学习数据库', 1, 3) c4 FROM dual;

例18：使用SUBSTR函数和SUBSTRB函数从右侧返回英文字符串和中文字符串的子串。
SELECT SUBSTR('oracle', -2, 3) c1, SUBSTRB('oracle', -2, 3) c2,
SUBSTR('学习数据库', -2, 3) c3, SUBSTRB('学习数据库', -2, 3) c4 FROM dual;

例19：使用ABS函数获取数值的绝对值。
SELECT ABS(123.456), ABS(0), ABS(-123.456) FROM dual;

例20：CEIL函数使用示例。
SELECT AVG(s_foreign), CEIL(AVG(s_foreign)) FROM student;
SELECT CEIL(-98.76), CEIL(-123.456) FROM dual;

例21：FLOOR函数使用示例，注意与CEIL函数进行对比。
SELECT AVG(s_foreign), FLOOR(AVG(s_foreign)) FROM student;
SELECT FLOOR(-98.76), FLOOR(-123.456) FROM dual;

例22：使用MOD函数获取2个数相除后的余数
SELECT MOD(123, 4), MOD(4, 123) FROM dual;

例23：查询各个班级的数学成绩的平均值并对其进行四舍五入。
SELECT s_classname, AVG(s_math), ROUND(AVG(s_math)), ROUND(AVG(s_math),2) FROM student
WHERE s_classname LIKE '%08%' GROUP BY s_classname ORDER BY s_classname;

例24：查询各个班级的数学成绩的平均值并对并对其进行截取。
SELECT s_classname, AVG(s_math), TRUNC(AVG(s_math)), TRUNC(AVG(s_math),2) FROM student
WHERE s_classname LIKE '%08%' GROUP BY s_classname ORDER BY s_classname;

例25：使用ADD_MONTHS函数进行日期的处理。
SELECT t_name, t_entertime, ADD_MONTHS(t_entertime, 12) FROM teacher;
SELECT ADD_MONTHS(SYSDATE, -2) FROM dual; 
SELECT ADD_MONTHS(TO_DATE('01-1月-2012 11:12:13','DD-MON-YYYY
2 HH24:MI:SS'), 5) FROM dual;

例26：使用CURRENT_DATE和CURRENT_TIMESTAMP函数获取当前时间。
SELECT CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;
ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy-mon-dd';
SELECT CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'yyyy-mm-dd hh24:mi:ssxff';
SELECT CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;
ALTER SESSION SET NLS_DATE_LANGUAGE = 'AMERICAN';
SELECT CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

例27：使用EXTRACT函数提取年份、月份等日期。
SELECT EXTRACT(YEAR FROM SYSDATE) year, EXTRACT(MONTH FROM SYSDATE) month,
EXTRACT(DAY FROM SYSDATE) day, EXTRACT(HOUR FROM SYSTIMESTAMP) + 8 hour,
EXTRACT(MINUTE FROM SYSTIMESTAMP) minute, EXTRACT(SECOND FROM SYSTIMESTAMP)
second FROM dual;
SELECT EXTRACT(HOUR FROM SYSDATE) hour FROM dual;
SELECT TO_CHAR(SYSDATE, 'hh24') hour, TO_CHAR(SYSDATE, 'mi') MINUTE,
TO_CHAR(SYSDATE, 'ss') SECOND FROM dual;
SELECT EXTRACT(YEAR FROM DATE '2012-1-1') year,
EXTRACT(HOUR FROM TIMESTAMP '2012-01-14 13:46:41') hour FROM dual;

例28：使用EXTRACT函数计算2个日期之间的时间差。
SELECT EXTRACT(DAY FROM (t2-t1) DAY TO SECOND) day, EXTRACT(HOUR FROM (t2-t1))
hour,EXTRACT(SECOND FROM (t2-t1)) second FROM
(SELECT TIMESTAMP '2011-02-04 15:07:00' t1
,TIMESTAMP '2012-05-17 19:08:46' t2 FROM dual);
SELECT t_id, t_name, t_entertime, '在职时间为:' ||
EXTRACT(YEAR FROM (SYSDATE - t_entertime) YEAR TO MONTH) || '年' ||
EXTRACT(MONTH FROM (SYSDATE - t_entertime) YEAR TO MONTH)||'月' 在职时间
FROM teacher;

例29：使用LAST_DAY函数获取当前日期所在月的最后一天。
SELECT SYSDATE, LAST_DAY(SYSDATE) last_day FROM dual;

例30：使用MONTHS_BETWEEN函数计算2个日期之间的月份差。
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') d1,
MONTHS_BETWEEN('01-2月-12', SYSDATE) d2,
MONTHS_BETWEEN('01-2月-12', TRUNC(SYSDATE)) d3 FROM dual;

例31：使用NEXT_DAY函数获取当前日期之后的第一个周五的时间。
SELECT SYSDATE, NEXT_DAY(SYSDATE, '星期五') FROM dual;

例32：使用ROUND函数对日期进行四舍五入。
SELECT ROUND(TO_DATE('2012-6-15 11:59:59', 'YYYY-MM-DD HH24:MI:SS')) d1,
TO_CHAR(ROUND(TO_DATE('2012-6-15 11:59:59', 'YYYY-MM-DD HH24:MI:SS')),'YYYY-MM-DD HH24:MI:SS') d2,
ROUND(TO_DATE('2012-6-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) d3,
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),'YYYY-MM-DD HH24:MI:SS') d4
FROM dual;

SELECT
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:29:59', 'YYYY-MM-DD HH24:MI:SS'), 'HH'), 'YYYY-MM-DD HH24:MI:SS') d1,
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'HH'), 'YYYY-MM-DD HH24:MI:SS') d2,
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:30:29', 'YYYY-MM-DD HH24:MI:SS'), 'MI'), 'YYYY-MM-DD HH24:MI:SS') d3,
TO_CHAR(ROUND(TO_DATE('2012-6-15 12:30:30', 'YYYY-MM-DD HH24:MI:SS'), 'MI'), 'YYYY-MM-DD HH24:MI:SS') d4
FROM dual;

SELECT ROUND(DATE '2012-6-15','MM') d1, ROUND(DATE '2012-6-16','MM') d2,
ROUND(DATE '2012-6-30','YY') d3, ROUND(DATE '2012-7-1','YY') d4
FROM dual;

例33：使用TRUNC函数对日期进行截取。
SELECT TRUNC(TO_DATE('2012-6-15 11:59:59', 'YYYY-MM-DD HH24:MI:SS')) d1,
TO_CHAR(TRUNC(TO_DATE('2012-6-15 11:59:59', 'YYYY-MM-DD HH24:MI:SS')),'YYYY-MM-DD HH24:MI:SS') d2,
TRUNC(TO_DATE('2012-6-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) d3,
TO_CHAR(TRUNC(TO_DATE('2012-6-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),'YYYY-MM-DD HH24:MI:SS') d4
FROM dual;
SELECT
TO_CHAR(TRUNC(TO_DATE('2012-6-15 12:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'HH'), 'YYYY-MM-DD HH24:MI:SS') d1,
TO_CHAR(TRUNC(TO_DATE('2012-6-15 12:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'MI'), 'YYYY-MM-DD HH24:MI:SS') d2
FROM dual;
SELECT TRUNC(DATE '2012-12-30', 'YY') d1, TRUNC(DATE '2012-12-30', 'MM')d2
FROM dual;

例34：求学号为0807070303的学生期末考试的总成绩。
SELECT s_id, s_commongrade + s_finalgrade AS total FROM score
WHERE s_id = '0807070303';

例35：计算学生的总成绩，其中期末成绩的权重是0.7。
SELECT s_id, s_commongrade + NVL2(s_finalgrade, s_finalgrade*0.7, 0) AS
total FROM score  WHERE s_id = '0807070303';

例36：使用NULLIF函数判断学生的职务。
SELECT NULLIF(s_duty, '体育委员'), NULLIF(s_duty, '生活委员')
FROM student WHERE s_name = '李金龙';

例37：使用COALESCE函数改写例34。
SELECT s_id, s_commongrade + COALESCE(s_finalgrade, 0) AS total
FROM score WHERE s_id = '0807070303';

例38：使用TO_CHAR将数值型数据转换成各种格式的字符型数据。
SELECT TO_CHAR(1234567, '9,999,999') c1, TO_CHAR(123.456, '9999.9999') c2,
TO_CHAR(123.456, '999.99') c3, TO_CHAR(123.4, '09999.990') c4,
TO_CHAR(12.466666, '99.99') c5, TO_CHAR(1234, '$9,999') c6,
TO_CHAR(12.35, 'L99.9') c7 FROM dual;

例39：使用TO_CHAR将数值型数据转换成各种格式的字符型数据。
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD hh24:mi:ss.ff3') d1,
TO_CHAR(SYSTIMESTAMP, 'YEAR-month','nls_date_language = American') d2,
TO_CHAR(SYSTIMESTAMP, 'WW') d3, TO_CHAR(SYSDATE, 'W') d4 FROM dual;

例40：使用TO_DATE将数值型数据转换成各种格式的字符型数据。


例41：使用TO_NUMBER将数值型数据转换成各种格式的字符型数据。


例42：使用DECODE函数将教师表中的职称号变为职称名。
SELECT t_id, t_name, t_research,
DECODE(t_titleid, 1, '教授', 2, '副教授', 3, '讲师', 4, '助教',
5, '高级工程师', 6, '工程师', 7, '研究员', 8,'副研究员', 9, '助理研究员',
'其他') AS title
FROM teacher;

例43：使用DECODE函数获得在不同等级期刊上发表论文的科研分数。
SELECT p.paper_title, p.paper_journal,
DECODE(journal_level, 'TOP', 5*10, '国际A', 4*10, '国际B', 3*10,
'国内A', 3*10, '国内B', 2*10, 1*10
) AS paper_score
FROM paper p, journal j
WHERE p.paper_journal = j.journal_name(+)
ORDER BY paper_score DESC;

例44：DECODE函数中列值为空值的情况。
SELECT s_id, s_name, DECODE(s_duty, NULL, '没有职务', s_duty) FROM student;

例45：在ORDER BY子句中使用DECODE函数实现固定排序的功能。
SELECT AVG(s_foreign), s_classname FROM student GROUP BY s_classname
ORDER BY DECODE(s_classname, '信管081', 1, '信管082',2,'工商081', 3,'工商082',
4, '工商083', 5, '国贸081', 6, '国贸082', 7, '工商091', 8, '工商092', 8);

例46：使用DUMP函数获取数据的内部保存内容。
SELECT DUMP('dba') a, DUMP('dba', 16) b,DUMP('dba',1016) c, DUMP('dba',1016, 2, 3) d
FROM dual;
