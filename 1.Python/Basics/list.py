# List => mutable sequence of values
# CAN store different types of datatypes

marks = [100,200,300,400]

marks[0] = 5
print(marks)
print(marks[2:])
print(len(marks)) 


# Methods
marks.append(50)
marks.insert(4,10) # Pushesh other value
print(marks)
marks.sort()
marks.reverse()
print(marks)