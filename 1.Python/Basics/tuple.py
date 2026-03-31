# Tuple => immutable sequence of values

tup = (1,2,3,4,2,5,6)
print(tup)

t = (1) # not a tuple => expression
t2 = (1,)
print(type(t))
print(type(t2))
print(tup[2:])


# Methods
print(tup.index(4)) # return idx
print(tup.count(2))