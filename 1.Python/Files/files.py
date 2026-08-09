# f = open("sample.txt", "r")

# # print(f.read())
# print(f.readline())

# f.close()


f = open("sample.txt", "w")

f.write("Text is overrriden")

f.close()


'''
 a -> append mode
 x -> creates new file and write --> difference between this and "w" is --> if file exist this will throw an error --> therefore creating newfile do this 

 b -> binary
 t -> text

 + -> like r+, w+ and a+   -> can do both read and write 

'''


# delete files
import os

os.remove("sample2.txt")