import random
import mysql.connector
mycon=mysql.connector.connect(host="localhost",user="root",passwd="qwerty",database="question_paper_db")
cursor=mycon.cursor()
quest=[]
def add_quest():
    print("----Add a new question----")
    n=int(input("Enter number of questions want to add:"))
    for i in range(n):
        print("Enter details for question", i+1)
        cls=input("Enter class (11/12):")
        subject=input("Enter subject: ").strip().lower()
        chap=input("Enter chapter name:").strip().lower()
        question_text=input("Enter question: ")
        mrk=float(input("Enter marks: "))
        print("select difficulty:")
        print("(a)Easy")
        print("(b)Medium")
        print("(c)Hard")
        ch=input("Enter your choice(a/b/c):")
        if ch=="a":
            difficulty="Easy"
        elif ch== "b":
            difficulty="Medium"
        elif ch== "c":
            difficulty="Hard"
        else:
            print("Invalid choice!")
            continue
        mysql="insert into questions (class,subject,chapter,ques_text,marks,difficulty) values(%s,%s,%s,%s,%s,%s)"
        values=(cls,subject,chap,question_text,mrk,difficulty)
        cursor.execute(mysql, values)
        mycon.commit()
        print("Qusetion added successfully!")
    print("All questions have been added!!")

def generate_paper():
    print("--- GENERATE QUESTION PAPER ---")
    cls=input("Enter class (11/12): ")
    subject=input("Enter subject: ")
    print("Select paper type:")
    print("1. Chapter-wise paper")
    print("2. Whole-syllabus paper")
    choice=input("Enter choice (1/2): ")
    if choice=="1":
        chap=input("Enter chapter name: ")
        sql="""SELECT ques_text, marks, difficulty FROM questions WHERE class=%s AND lower(subject)=lower(%s) AND lower(chapter)=lower(%s)"""
        values=(cls, subject, chap)
    elif choice == "2":
        sql="SELECT ques_text, marks, difficulty FROM questions WHERE class=%s AND lower(subject)=lower(%s)"
        values=(cls, subject)
    else:
        print("Invalid paper type!!")
        return
    total_marks = int(input("Enter total marks (maximum 15): "))
    if total_marks < 1 or total_marks > 15:
        print("Please enter marks between 1 and 15")
        return
    cursor.execute(sql, values)
    questions = cursor.fetchall()
    if not questions:
        print("No questions found!Please add questions first.")
        return
    import random
    questions.sort(key=lambda j:j[1])
    selected=[]
    marks_count=0
    for j in questions:
        if marks_count+j[1] <= total_marks:
            selected.append(j)
            marks_count= marks_count+j[1]
        if marks_count == total_marks:
            break
    if marks_count < total_marks:
        print("Not enough questions are available!")
        print("Only",marks_count,"marks could be generated.")
        print("Please add more questions!")
        return
    print("================================")
    print("        QUESTION PAPER          ")
    print("================================")
    print("Class:", cls)
    print("Subject:", subject)
    if choice=="1":
        print("Chapter:", chap)
    else:
        print("Syllabus: Whole syllabus")
    print("Maximum Marks:", marks_count)
    print("--------------------------------")
    for i in range(len(selected)):
        print(i + 1,".", selected[i][0],"(", selected[i][1], "marks )")
    print("--------------------------------")
    print("Total Questions:", len(selected))
    print("Total Marks:", marks_count)
    print("================================")
while True:
    print("===== QUESTION PAPER GENERATOR =====")
    print("1. Generate Question Paper")
    print("2. Add New Question")
    print("3. Exit")
    option = input("Enter your choice (1/2/3): ")
    if option == "1":
        generate_paper()
    elif option == "2":
        add_quest()
    elif option == "3":
        print("Thank you for using Question Paper Generator!")
        break
    else:
        print("Invalid choice.Please try again.")
cursor.close()
mycon.close()

    


    
    
