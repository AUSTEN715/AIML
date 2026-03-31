# dictionary => Key value pairs 
# key -> Unique
# mutable

dict = {
    "name": "Austen",
    "cgpa": 9.2,
    "subject": ["maths", "English"],
    3.14: "Pi"
}

print(dict)
print(dict["name"])
dict[3.14] = "ya"
print(dict[3.14])


# Methods
abc = dict.keys() 
print(type(abc)) # type => dict_keys

print(type(list(dict.keys()))) # list

print(dict.items())

print(dict.get("name")) # This is better then [] since this gives none if not present

dict.update({
    "city": "Mumbai",
    "roll": 5
})

print(dict)