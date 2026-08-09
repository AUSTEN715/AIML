class Student:
    subject = "Python"

s1 = Student()
s1.subject = "snns"
print(s1.subject)


# Constructor
class Car:
    att = 4 # class attributes
    def __init__(self, name, ratting):  # self => current object (instance) -> compulsory
        self.name = name # instance attributes
        self.ratting = ratting
        print("Constructor called...")

    def get_ratting(self):
        return self.ratting

car1 = Car("City Honda", 4.9)
print(car1.name)
print(car1.ratting)