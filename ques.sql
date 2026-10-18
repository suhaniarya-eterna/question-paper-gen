 show databases ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| question_paper_db  |
| sys                |
+--------------------+
5 rows in set (0.0025 sec)
 show tables;
+-----------------------------+
| Tables_in_question_paper_db |
+-----------------------------+
| questions                   |
+-----------------------------+
desc questions;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| question_id | int          | NO   | PRI | NULL    | auto_increment |
| subject     | varchar(30)  | YES  |     | NULL    |                |
| ques_text   | varchar(300) | YES  |     | NULL    |                |
| marks       | float        | YES  |     | NULL    |                |
| difficulty  | varchar(15)  | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
5 rows in set (0.0068 sec)

 MySQL  localhost:33060+ ssl  question_paper_db  SQL > alter table questions
                                                    -> add class int notnull;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'notnull' at line 2
 MySQL  localhost:33060+ ssl  question_paper_db  SQL > alter table questions
                                                    -> add class int not null;
 desc questions;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| question_id | int          | NO   | PRI | NULL    | auto_increment |
| subject     | varchar(30)  | YES  |     | NULL    |                |
| ques_text   | varchar(300) | YES  |     | NULL    |                |
| marks       | float        | YES  |     | NULL    |                |
| difficulty  | varchar(15)  | YES  |     | NULL    |                |
| class       | int          | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
6 rows in set (0.0052 sec)
> alter table questions
                                                    -> add chapter varchar(30) not null;
Query OK, 0 rows affected (0.3212 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  question_paper_db  SQL > desc questions;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| question_id | int          | NO   | PRI | NULL    | auto_increment |
| subject     | varchar(30)  | YES  |     | NULL    |                |
| ques_text   | varchar(300) | YES  |     | NULL    |                |
| marks       | float        | YES  |     | NULL    |                |
| difficulty  | varchar(15)  | YES  |     | NULL    |                |
| class       | int          | NO   |     | NULL    |                |
| chapter     | varchar(30)  | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
7 rows in set (0.0051 sec)
 alter table questions modify class int not null first,modify subject varchar(30) after class,modify chapter varchar(30) not null after subject, modify question_id int auto_increment after chapter,modify ques_text varchar(300) after question_id, modify marks float after ques_text,modify difficulty varchar(10) after marks;
Query OK, 0 rows affected (0.2660 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  question_paper_db  SQL > desc questions;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| class       | int          | NO   |     | NULL    |                |
| subject     | varchar(30)  | YES  |     | NULL    |                |
| chapter     | varchar(30)  | NO   |     | NULL    |                |
| question_id | int          | NO   | PRI | NULL    | auto_increment |
| ques_text   | varchar(300) | YES  |     | NULL    |                |
| marks       | float        | YES  |     | NULL    |                |
| difficulty  | varchar(10)  | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
7 rows in set (0.0050 sec)
  insert into questions (class,subject,chapter,ques_text,marks,difficulty) values (11,'Physics','Units & Measurement','What is the dimension of Force?',1,'easy'), (11,'Physics','Units & Measurement','What is the SI unit of current?',1,'easy');
Query OK, 2 rows affected (0.0363 sec)

Records: 2  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  question_paper_db  SQL > select * from questions;
+-------+---------+---------------------+-------------+---------------------------------+-------+------------+
| class | subject | chapter             | question_id | ques_text                       | marks | difficulty |
+-------+---------+---------------------+-------------+---------------------------------+-------+------------+
|    11 | Physics | Units & Measurement |           1 | What is the dimension of Force? |     1 | easy       |
|    11 | Physics | Units & Measurement |           2 | What is the SI unit of current? |     1 | easy       |
+-------+---------+---------------------+-------------+---------------------------------+-------+------------+
2 rows in set (0.0013 sec)