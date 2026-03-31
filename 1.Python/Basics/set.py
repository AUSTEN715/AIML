# Set => collection of unique elements(which are immutable)
# un-ordered

s = {1,2,3,3,4} # 1 2 3 4
print(s)

# empty_set = {}   =>  creates dictionary
empty_set = set() # contructor function



# Methods
s.add(10)
s.remove(10)
s.pop() # removes RANDOM value
s.clear()
print(s)

s1 = {1,2,3,4,5}
s2 = {5,6,7,8}

print(s1.union(s2))
print(s1.intersection(s2))
