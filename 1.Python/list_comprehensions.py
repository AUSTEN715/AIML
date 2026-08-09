squares = []

for i in range(6):
    squares.append(i * i)

print(squares)


# List compressions
#     output  iterable         condition
sq = [i * i for i in range(6) if i%2 != 0]
print(sq)





nums = [-2, -3, 3, 4, -1, 7]
[0 if val < 0 else val for val in nums]