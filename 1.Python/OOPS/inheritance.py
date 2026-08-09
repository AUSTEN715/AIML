class Employee:
    start_time = "10am"
    end_time = "6pm"


class AdminStaff(Employee):
    def __init__(self, role):
        self.role = role


class Accountant(AdminStaff):
    def __init__(self, salary, role):
        super().__init__(role)
        self.salary = salary


acc1 = Accountant(25000, "CA")

print(acc1.role, acc1.salary, acc1.start_time, acc1.end_time)


# Multiple
class Teacher:
    def __init__(self, salary):
        self.salary = salary

class Student:
    def __init__(self, gpa):
        self.gpa = gpa

class TA(Teacher, Student):
    def __init__(self, salary, gpa, name):
        super().__init__( salary)
        Student.__init__(self, gpa)
        self.name = name

    def answer(self):
       return f"TA(name={self.name}, salary={self.salary}, gpa={self.gpa})"

ta = TA(1000, 10, "Austen")
print(ta.answer())
