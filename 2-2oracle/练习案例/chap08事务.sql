例1：使用COMMIT语句完成事务的提交
--打开SQL*Plus客户端（会话1）
SQL> CREATE TABLE test(id NUMBER PRIMARY KEY, name VARCHAR2(10));
SQL> INSERT INTO test VALUES(1, '张三');
SQL> COMMIT;
SQL> INSERT INTO test VALUES(2, '李四');
SQL> CREATE VIEW v_test AS SELECT * FROM test;
--再打开另一个SQL*Plus客户端（会话2）
SQL> SELECT id, name FROM test;
SQL> SELECT id, name FROM test;
SQL> SELECT id, name FROM test; 
SQL> SELECT id, name FROM test;

例2：使用ROLLBACK语句和保存点技术完成事务的部分回滚和完全回滚
--延续例1
SQL> INSERT INTO test VALUES(3, '王五');
SQL> SAVEPOINT a;
SQL> INSERT INTO test VALUES(4, '赵六');
SQL> SAVEPOINT b;
SQL> INSERT INTO test VALUES(5, '钱七');
SQL> SELECT id, name FROM test;    
SQL> ROLLBACK TO SAVEPOINT a; 
SQL> SELECT id, name FROM test;
SQL> ROLLBACK TO SAVEPOINT b; 
SQL> ROLLBACK;

例3：接续例2，表中现在有2条数据。使用读提交级别和序列化级别进行事务处理。
--打开SQL*Plus客户端（会话1）
SQL> INSERT INTO test VALUES(3, '王五');
SQL> COMMIT;
SQL> DELETE FROM test WHERE id = 3;
SQL> COMMIT;
SQL> INSERT INTO test VALUES(3, '王五');
SQL> COMMIT;
SQL> UPDATE test SET name = '李四1' WHERE id = 2;
SQL> COMMIT;
SQL> UPDATE test SET name = '李四' WHERE id = 2;
SQL> COMMIT;
--再打开另一个SQL*Plus客户端（会话2）
SQL> SELECT id, name FROM test;
SQL> SELECT id, name FROM test;
SQL> SELECT id, name FROM test;
SQL> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SQL> SELECT id, name FROM test;
SQL> COMMIT;
SQL> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SQL> SELECT id, name FROM test;
SQL> COMMIT;
SQL> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SQL> UPDATE test SET name = '李四2' WHERE id= 2;
SQL> UPDATE test SET name = '李四2' WHERE id= 2;
SQL> COMMIT;

例4：使用只读级别进行事务处理。
--打开SQL*Plus客户端（会话1）
SQL> INSERT INTO test VALUES(4, '赵六');
SQL> COMMIT;
SQL> UPDATE test SET name = '赵六1' WHERE id = 4;
SQL> COMMIT;
--再打开另一个SQL*Plus客户端（会话2）
SQL> SET TRANSACTION READ ONLY;
SQL> SELECT id, name FROM test;
SQL> COMMIT;
SQL> SET TRANSACTION READ ONLY;
SQL> SELECT id, name FROM test;
SQL> COMMIT;
SQL> SET TRANSACTION READ ONLY;
SQL> UPDATE test SET name = '李四2' WHERE id= 2;

例5：使用SELECT FOR UPDATE语句加锁。
--打开SQL*Plus客户端（会话1）
SQL> UPDATE test SET name ='赵六' WHERE id=4;
SQL> ROLLBACK;
--再打开另一个SQL*Plus客户端（会话2）
SQL> SELECT * FROM test FOR UPDATE NOWAIT;
SQL> SELECT * FROM test FOR UPDATE WAIT 3;
SQL> SELECT * FROM test FOR UPDATE;
SQL> ROLLBACK;

例6：使用LOCK TABLE语句加锁。
--打开SQL*Plus客户端（会话1）
SQL> UPDATE test SET name ='赵六' WHERE id=4;
SQL> ROLLBACK;
--再打开另一个SQL*Plus客户端（会话2）
SQL> LOCK TABLE test IN ROW EXCLUSIVE MODE NOWAIT;
SQL> LOCK TABLE test IN SHARE MODE NOWAIT;
SQL> LOCK TABLE test IN EXCLUSIVE MODE NOWAIT;
SQL> ROLLBACK;

例7：使用v$lock视图查看锁信息。
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S',
3, 'Row-X', 4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode
FROM v$lock a WHERE a.type in ('TM', 'TX');
UPDATE teacher SET t_name = '张三' WHERE t_id = '060001';
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S',
3, 'Row-X', 4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode
FROM v$lock a WHERE a.type in ('TM', 'TX');
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S', 3, 'Row-X',
'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode, object_name
FROM v$lock a, all_objects b WHERE a.type in ('TM', 'TX') AND 
b.object_id(+) = a.id1;
DELETE award_author WHERE award_id = 1;
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S', 3, 'Row-X',
4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode, object_name
FROM v$lock a, all_objects b WHERE a.type in ('TM', 'TX') AND 
a.id1 = b.object_id(+);
ROLLBACK;
LOCK TABLE test IN SHARE ROW EXCLUSIVE MODE NOWAIT;
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S',
3, 'Row-X', 4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode
FROM v$lock a WHERE a.type in ('TM', 'TX');
ROLLBACK;
SELECT a.type, DECODE(a.lmode, 0, 'None', 1, 'Null', 2, 'Row-S',
3, 'Row-X', 4, 'Share', 5, 'S/Row-X',  6, 'Exclusive', 'Unknown') LockMode
FROM v$lock a WHERE a.type in ('TM', 'TX');









































































