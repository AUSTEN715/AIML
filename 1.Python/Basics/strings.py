# sequence of characters 
word = "Practical"  # immutable

print(word[2])



# Slicing
print(word[2:7:2])



# Formatting 
# 1. Formate()

a = 5
b = 10
sum = a+b

print("Sum is {}".format(sum))
print("Language is {}".format("Konkani"))
print("Language is {} and {} and {}".format("Konkani","English","Maths"))
print("Language is {2} and {0} and {1}".format("Konkani","English","Maths")) # index based formatting
print("Language is {e} and {m} and {k}".format(k = "Konkani",e = "English",m = "Maths")) # value based formatting



# 2. F-string

print(f"sum of {a} and {b} = {sum}")