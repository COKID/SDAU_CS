例1：只使用SELECT子句来获取当前服务器的时间。
SELECT SYSDATE;

例2：查询学历表中所有列的信息。
SELECT * FROM diploma;
 
例3：从教师表中查询教师编号、教师姓名、入职时间、职务和研究方向。
SELECT t_id, t_name, t_entertime, t_duty, t_research FROM teacher; 

例4：从学生表中查询学生的职务，如果该列上的值为空值则结果显示“没有职务”。
SELECT s_id, s_name, s_classname, NVL(s_duty, '没有职务') FROM student;

例5：从学生表中查询学生的学号，并通过算数表达式计算出该学生的语文、外语和数学的总成绩。
SELECT s_id, s_name, s_classname, s_chinese+ s_math + s_foreign FROM student;

例6：从学生表中查询学生的学号和姓名，并在学号和姓名的前面分别加上字符常量“学生学号”和“学生姓名”。
SELECT '学生学号是：' || s_id 学号,'学生姓名是：' ||s_name 姓名 FROM student;

例7：从教师中查询列t_id、t_name和t_research，并分别为这3个列起别名“教师编号”、“教师姓名”和“研究方向”。
SELECT t_id 教师编号, t_name 教师姓名, t_research 研究方向 FROM teacher; 

例8：使用AS关键字为例7中的3个列起别名，效果与例7相同。
SELECT t_id AS 教师编号, t_name AS 教师姓名, t_research AS 研究方向FROM teacher;

例9：使用AS关键字为t_id列和t_name列起别名，别名是英文单词组成且包含空格，此时必须使用双引号。
SELECT t_id AS "Id of teacher", t_name AS "Name of teacher" FROM teacher; 

例10：查询专业是“管理科学与工程”的教师的编号、姓名、研究方向和毕业学校。
SELECT t_id, t_name, t_research, t_university FROM teacher
WHERE t_specialty = '管理科学与工程';

例11：查询2006年1月1日之后入职的教师的编号和姓名。
SELECT t_id, t_name, t_research FROM teacher WHERE t_entertime > '2006-1-1';

例12：修改会话的日期格式，然后查询2006年1月1日之后入职的教师的编号和姓名。
ALTER SESSION SET NLS_LANGUAGE = 'AMERICAN';
SELECT t_id, t_name,t_research FROM teacher WHERE t_entertime>'01-Jan-2006'; 

例13：根据课程的英文名来查询课程的中文名称、学分、考核方式和上课班级。
SELECT c_name, c_credits, c_assway, c_class FROM course
WHERE c_ename = 'SPECIAL ENGLISH'; 

例14：查询期刊表中所有期刊名中包含“INFORMATION”的期刊。
SELECT * FROM journal WHERE journal_name LIKE UPPER('%information%');

例15：查询学生表中英语成绩在120分到130分之间的学生信息。
SELECT s_id, s_name, s_nation, s_political, s_classname FROM student
WHERE s_foreign BETWEEN 120 AND 130;

例16：查询入职时间在2003年4月1日到2003年4月30日之间的教师的相关信息。
SELECT t_id, t_name, t_entertime, t_research FROM teacher
WHERE t_entertime BETWEEN '1-4月-2003' AND '30-4月-2003';

例17：查询专业为“计算机应用”或“计算机系统结构”的教师编号、姓名和研究方向。
SELECT t_id, t_name, t_research FROM teacher
WHERE t_specialty IN ('计算机应用', '计算机系统结构');

例18：查询职务为“团支书”或“班长”的学生的学号、姓名、政治面貌和班级。
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_duty IN ('团支书', '班长');

例19：查询职务不是“团支书”或“班长” 的学生的学号、姓名、政治面貌和班级。
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_duty NOT IN ('团支书', '班长');
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_duty IS NOT NULL;

例20：查询毕业学校是“大连海事大学”、专业是“计算机应用”和毕业学校是“华中科技大学”、专业是“计算机科学与技术”的教师的编号、姓名、毕业学校和专业。
SELECT t_id, t_name, t_university, t_specialty FROM teacher
WHERE (t_university, t_specialty)
IN (('大连海事大学', '计算机应用'), ('华中科技大学', '计算机科学与技术'));

例21：查询研究方向包含“数据挖掘”的教师的编号、姓名和研究方向。
SELECT t_id, t_name, t_research FROM teacher
WHERE t_research LIKE '%数据挖掘%';

例22：查询政治面貌为“党员”或“预备党员”的学生的学号、姓名、政治面貌和班级。
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_political LIKE '%党员';

例23：查询姓为“王”，姓名长度为2个字的学生的学号、姓名和班级。
SELECT s_id, s_name, s_classname FROM student WHERE s_name LIKE '王_';

例24：查询2003年入职的所有教师的编号、姓名、入职时间和研究方向。
SELECT t_id, t_name, t_entertime, t_research FROM teacher
WHERE t_entertime LIKE '%2003%';

例25：查询2003年4月入职的所有教师的编号、姓名、入职时间和研究方向。
SELECT t_id, t_name, t_entertime, t_research FROM teacher
WHERE TO_CHAR(t_entertime, 'yyyy-mm-dd') LIKE '%2003-04%';

例26：查询所有政治面貌为党员的学生的学号、姓名、政治面貌和所在班级。
SELECT s_id, s_name, s_political, s_classname FROM student
WHERE s_political LIKE '党员';

例27：查询没有参加期末考试的学生的学号和课程号。
SELECT s_id, c_num FROM score WHERE s_finalgrade IS NULL; 

例28：查询担任职务的学生的学号、姓名和职务。
SELECT s_id, s_name, s_duty FROM student WHERE s_duty IS NOT NULL;

例29：查询类型为“学科基础”、学分大于3且为“信管”专业开出的课程的信息。
SELECT c_num, c_name, c_type, c_nature FROM course
WHERE c_type = '学科基础' AND c_credits >=3 AND C_CLASS LIKE '%信管%';

例30：查询研究方向与“数据库”或“人工智能”相关的教师的编号和姓名。
SELECT t_id, t_name, t_research FROM teacher
WHERE t_research LIKE '%数据库%' OR t_research LIKE '%人工智能%';

例31：查询语种为"英语"且成绩大于130分或语种为"日语"且成绩大于120分的学生的学号和姓名。
SELECT s_id, s_name, s_language, s_classname FROM student
WHERE (s_language = '英语' AND s_foreign > 130)
OR (s_language = '日语' AND s_foreign > 120);

例32：查询课程表中教师的编号（也就是开了课程的教师的编号）。
SELECT t_id FROM course; 

例33：查询课程表中开课教师的编号及其所授的课程名。
SELECT DISTINCT t_id, c_name FROM course;

例34：查询显示表中学生职务的值有哪些。
SELECT DISTINCT s_duty FROM student;

例35：按照课程类别对课程表进行分组。
SELECT c_type FROM course GROUP BY c_type; 

例36：查询学生表中学生语文成绩的平均值。
SELECT AVG(s_chinese) FROM student; 

例37：按照班级分组查询学生表中学生语文成绩的平均值。
SELECT AVG(s_chinese), s_classname FROM student
GROUP BY s_classname;

例38：按照课程类别分组查询课程表中每种类型的课程的总课时数。
SELECT SUM(c_thours), c_type FROM course GROUP BY c_type; 

例39：统计学生表中的总学生数和担当职务的学生数。
SELECT COUNT(*), COUNT(1), COUNT(s_duty) FROM student;

例40：查询成绩表中的学号为0807070303的学生期末成绩的平均值。
SELECT s_id, s_finalgrade FROM score WHERE s_id = '0807070303';

例41：分别查询教师表中的最早和最晚的入职时间。
SELECT MIN(t_entertime), MAX(t_entertime) FROM teacher;

例42：查询课程表中开课教师的人数。
SELECT COUNT(DISTINCT t_id), COUNT(t_id) FROM course;

例43：根据课程的类型和考核方式对课程信息进行分类。
SELECT c_type, c_assway FROM course GROUP BY c_type, c_assway;

例44：查询学生表中最高的班级外语平均成绩。
SELECT MAX(AVG(s_foreign)) FROM student GROUP BY s_classname;

例45：按照班级分组查询学生表中学生语文的平均成绩大于108分的班级。
SELECT AVG(s_chinese), s_classname FROM student
GROUP BY s_classname
HAVING AVG(s_chinese) > 108;

例46：求出信管专业各班级的数学的平均成绩。
SELECT AVG(s_math) FROM student
GROUP BY s_classname HAVING s_classname LIKE '%信管%';
SELECT AVG(s_math) FROM student
WHERE s_classname LIKE '%信管%' GROUP BY s_classname;

例47：查询教师表中的教师编号、姓名、入职时间和研究方向，并按照教师的入职时间以升序的方式排序。
SELECT t_id,t_name,t_entertime,t_research FROM teacher
ORDER BY t_entertime;

例48：查询学生表中的学生编号、姓名、数语外的总成绩和所在班级，并按照数语外的总成绩以降序的方式排序。
SELECT s_id, s_name, s_chinese+s_foreign+s_math, s_classname FROM student
ORDER BY s_chinese + s_foreign + s_math DESC;

例49：查询学生表中的学生编号、姓名、数语外的总成绩和所在班级，并按照数语外的总成绩以降序的方式排序。
SELECT s_id, s_name, s_chinese + s_foreign + s_math, s_classname FROM student 
ORDER BY 3 DESC;

例50：查询学生表中的学生编号、姓名和所在班级，并按照外语成绩以降序的方式排序。
SELECT s_id, s_name, s_classname FROM student ORDER BY 10 DESC;

例51：查询学生表中的学生编号、姓名、外语成绩和数学成绩，并按照外语成绩降序、数学成绩升序的方式排序。
SELECT s_id, s_name, s_foreign, s_math FROM student ORDER BY 3 DESC,4 ASC;

例52：将例50中的序号10去掉，改为列名就可以正确查询出所要的数据。
SELECT s_id, s_name, s_classname FROM student ORDER BY s_foreign DESC;

例53：查询学号为“0807070303”的学生的2010-2011(1)学期的期末考试成绩，成绩按照升序的方式排列。
SELECT s_finalgrade FROM score
WHERE s_id = '0807070303' AND c_term = '2010-2011(1)'
ORDER BY s_finalgrade;

例54：查询所有教师的编号、姓名和研究方向，并按照姓名排序。
SELECT t_id, t_name, t_research FROM teacher ORDER BY t_name;

例55：查询所有教师的编号、姓名和学历。
SELECT t_id, t_name, t_research, diploma_name
FROM teacher, diploma
WHERE teacher.t_diplomaid = diploma.diploma_id;

例56：查询所有专业为“计算机应用”或“计算机系统结构”的教师的学历等信息。
SELECT t_id, t_name, t_research, diploma_name
FROM teacher, diploma
WHERE teacher.t_diplomaid = diploma.diploma_id AND
(teacher.t_specialty='计算机应用' OR teacher.t_specialty='计算机系统结构');

例57：查询所有获奖教师的编号、姓名和获奖的名称及排名，并按照教师编号和获奖排名排序。
SELECT teacher.t_id, t_name, award_name,'排名第' || award_sequence AS 排名
FROM award, award_author, teacher
WHERE award.award_id = award_author.award_id AND
award_author.t_id = teacher.t_id ORDER BY t_id, award_sequence;

例58：使用USING子句对教师表和课程表做内连接，查询查询教师开课的课程名等信息。
SELECT t_id, t_name, t_specialty, c_name  --t_id前不是使用表名，其他列可以
FROM course JOIN teacher USING(t_id);

例59：查询所有教师的授课信息（不重复显示同一个教师所开的相同名称的课程），包括没有开课的教师信息。
SELECT DISTINCT teacher.t_id, t_name, c_name
FROM teacher, course
WHERE teacher.t_id = course.t_id(+)
ORDER BY t_id;

例60：查询期刊表中所有的期刊名称及发表在该期刊上的文章信息。
SELECT journal_name, journal_level AS jlevel, paper_title
FROM paper p, journal j
WHERE p.paper_journal(+) = j.journal_name
ORDER BY jlevel;

例61：查询教师发表的论文信息，如果是发表在学校规定的核心期刊上，则显示核心期刊名、等级和论文题目，否则只显示论文题目。
SELECT journal_name, journal_level AS jlevel, paper_title
FROM paper p, journal j
WHERE j.journal_name(+) = p.paper_journal
UNION
SELECT journal_name, journal_level, paper_title
FROM paper p, journal j
WHERE j.journal_name = p.paper_journal(+)
ORDER BY jlevel;

例62：对教师表和课程表做自然连接，查询教师开课的课程名等信息。
SELECT t_id, t_name, t_specialty, c_name
FROM teacher NATURAL JOIN course;

例63：查询教师表和课程表的教师名和课程名。
SELECT t_name, t_duty, t_research, c_name, c_type, c_nature
FROM teacher, course;

例64：查询和“陈少勇”具有相同职称的教师的编号和姓名。
SELECT t1.t_id, t1.t_name, t1.t_duty, t1.t_research, t.title_name
FROM teacher t1, teacher t2, title t
WHERE t1.t_titleid = t2.t_titleid AND t2.t_name = '陈少勇'
AND  t1.t_titleid = t.title_id;

例65：查询学号为“0807070315”的学生所在班级的班长的学号和姓名。
SELECT s1.s_id, s1.s_name, s2.s_id, s2.s_name
FROM student s1, student s2
WHERE s1.s_classname = s2.s_classname AND
s1.s_id = '0807070315' AND s2.s_duty = '班长';

例66：使用标准的SQL语法改写例64。
SELECT t1.t_id, t1.t_name, t1.t_duty, t1.t_research, t.title_name
FROM teacher t1 JOIN teacher t2
ON t1.t_titleid = t2.t_titleid JOIN title t
ON t1.t_titleid = t.title_id AND t2.t_name = '陈少勇';

例67：在SELECT子句中使用子查询，统计教师和学生的数量。
SELECT (SELECT COUNT(*) FROM teacher) AS 教师数量,
(SELECT COUNT(*) FROM student) AS 学生数量 FROM dual;

例68：在INSERT子句中使用子查询。下面的SQL语句创建一个新表test，然后向将教师表中的记录全部插入到test表中。
CREATE TABLE test(id NUMBER, name VARCHAR2(20));
INSERT INTO test SELECT t_id, t_name FROM teacher;

例69：在UPDATE子句中使用子查询。下面的SQL语句将学号为“0807070115”的学生的外语成绩修改为所有学生外语成绩的平均值。
UPDATE student SET s_foreign = (SELECT AVG(s_foreign) FROM student)
WHERE s_id = '0807070115';

例70：在DELETE子句中使用子查询。下面的SQL语句删除教师表中没有开课的教师的信息。
DELETE FROM student WHERE s_id IN
(SELECT s_id FROM student WHERE s_duty = '学习委员');

例71：查询在“张续伟”入职之后入职的教师的编号、姓名和研究方向。
SELECT t_id, t_name, t_research FROM teacher WHERE t_entertime >
(SELECT t_entertime FROM teacher WHERE t_name='张续伟');

例72：查询与学号为“0807070105”的学生在相同班级且政治面貌相同的学生的学号、姓名、班级和政治面貌。
SELECT s_name, s_classname, s_political FROM student
WHERE (s_classname, s_political) =
(SELECT s_classname, s_political FROM student
WHERE s_id = '0807070105');

例73：查询外语成绩大于等于130分的学生所在班级班长的学号、姓名和所在班级。
SELECT s_id, s_name, s_classname  FROM student
WHERE s_classname IN (
SELECT DISTINCT s_classname FROM student
WHERE s_foreign >= 130)  AND s_duty = '班长';

例74：国贸专业08级学生，只要其成绩高于08级的任何一个班级的数学平均分，就将其信息查询出来。
SELECT s_id, s_name, s_classname, s_math FROM student
WHERE s_math > ANY (SELECT AVG(s_math) FROM student
WHERE s_classname LIKE '%08%' GROUP BY s_classname)
AND s_classname LIKE '%国贸08%';

例75：查询国贸专业08级学生成绩高于所有08级各专业班级数学平均分的学生的信息。
SELECT s_id, s_name, s_classname, s_math FROM student
WHERE s_math > ALL (SELECT AVG(s_math) FROM student
WHERE s_classname LIKE '%08%' GROUP BY s_classname)
AND s_classname LIKE '%国贸08%';

例76：查询学号为“0807070301”的学生选修的课程的信息。
SELECT c_term, c_num, c_seq, c_name FROM course
WHERE (c_term, c_num, c_seq) IN (SELECT c_term, c_num, c_seq FROM score
WHERE s_id = '0807070301');

例77：查询每个班级中比本班外语成绩平均分高的学生的学号、外语成绩和班级。
SQL> SELECT s_id, s_name, s_foreign, s_classname FROM student s1
  2  WHERE s_foreign >(SELECT AVG(s_foreign) FROM student s2
  3                        WHERE s1.s_classname = s2.s_classname);

例78：查询没有开课教师的编号等信息。
SELECT t_id, t_name, t_duty, t_research FROM teacher WHERE NOT EXISTS
(SELECT c_num, c_seq, c_name FROM course WHERE course.t_id = teacher.t_id);

例79：改写例78，在子查询的SELECT子句中使用常量。
SELECT t_id, t_name, t_duty, t_research FROM teacher
WHERE NOT EXISTS (SELECT 1 FROM course WHERE course.t_id = teacher.t_id);

例80：查询在“国内A”级别期刊上发表论文的教师的信息。
SELECT t_id, t_name, t_duty, t_research FROM teacher WHERE EXISTS
(SELECT * FROM journal, paper, paper_author WHERE journal.journal_name
= paper.paper_journal AND journal_level = '国内A' AND paper_author.paper_id
= paper.paper_id AND paper_author.t_id = teacher.t_id);

例81：使用NOT IN运算符将例78。
SELECT t_id, t_name, t_duty, t_research FROM teacher
WHERE t_id NOT IN (SELECT t_id FROM course);

例82：使用IN运算符将例80改为下面的查询语句：
SELECT t_id, t_name, t_duty, t_research FROM teacher WHERE t_id IN
(SELECT teacher.t_id FROM journal, paper, paper_author
WHERE journal.journal_name = paper.paper_journal
AND journal_level = '国内A' AND paper_author.paper_id = paper.paper_id
AND paper_author.t_id = teacher.t_id);

例83：查询国贸081班外语成绩大于120分以及工商083班外语成绩大于130分的学生信息。
SELECT s_id, s_name, s_classname, s_language, s_foreign FROM student
WHERE s_classname = '国贸081' AND s_foreign >= 120
UNION
SELECT s_id, s_name, s_classname, s_language, s_foreign FROM student
WHERE s_classname = '工商083' AND s_foreign >= 130;

例84：使用UNION运算符查询工商083班语文成绩大于120分或外语成绩大于130分的学生信息。
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '工商083' AND s_chinese >= 120
UNION
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '工商083' AND s_foreign >= 130;

例85：使用UNION ALL运算符查询工商083班语文成绩大于120分或外语成绩大于130分的学生信息。
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '工商083' AND s_chinese >= 120
UNION ALL
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '工商083' AND s_foreign >= 130;

例86：使用UNION运算符查询为工商081班上课的教师，并将这些教师工商081班学生的信息和在一起输出。
SELECT s_id id, s_name name, s_gender gender
FROM student WHERE s_classname = '工商081'
UNION
SELECT t_id, t_name, t_gender FROM teacher WHERE EXISTS
(SELECT 1 FROM course
WHERE teacher.t_id = course.t_id AND course.c_class LIKE '%工商081%')
ORDER BY id;

例87：使用INTERSECT运算符查询工商083班语文成绩大于120分且外语成绩大于130分的学生信息。
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '工商083' AND s_chinese >= 120
INTERSECT
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '工商083' AND s_foreign >= 130;

例88：使用MINUS运算符实现例84的查询功能。
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '工商083' AND s_chinese >= 120
MINUS
SELECT s_id, s_name, s_classname, s_language, s_chinese, s_foreign
FROM student WHERE s_classname = '工商083' AND s_foreign <= 130;



