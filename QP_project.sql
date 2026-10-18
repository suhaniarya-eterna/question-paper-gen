create database question_paper;
use question_paper;
create table questions
(
question_id int primary key auto_increment , 
class int not null,
subject varchar(30),
chapter varchar(50),
ques_text varchar(300),
marks float,
difficulty varchar(10)
);
use questions; 
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
values(11,'Physics','Units and Measurement','What is the dimensional formula of force?',2,'easy');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
VALUES (11,'Physics','Units and Measurement','What is the SI unit of current?',1,'easy');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
VALUES (11,'Physics','Motion in Straight Line','Define uniform motion?',2,'medium');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
values(12,'Physics','Electrostatics','Explain electrostatic induction',3,'medium');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
values(12,'Physics','Current electricity','Define current density',2,'medium');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
values(12,'Physics','Electrostatic','Explain the relation between electric field and potential',3,'medium');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
values(12,'CS','File Handling','What is the difference b/w a text file and binary file?',3,'medium');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
values(12,'CS','DBMS','What is the purpose of database?',2,'medium');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
values(12,'CS','File Handling','What is the difference b/w serialization and de-serialization?',2,'medium');
INSERT into questions (class,subject,chapter,ques_text,marks,difficulty)
values(12,'CS','File Handling','Define pattern matching',2,'medium');

