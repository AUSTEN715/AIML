try:
    x = int(input("enter x: "))
    ans = 10/x

except ZeroDivisionError:
    print(f"Divide by zero is not allowed")

except ValueError:
    print(f"Invalid input")

else: 
    print(f"ans = {ans}")

finally:  # Surely excute
    print("End")