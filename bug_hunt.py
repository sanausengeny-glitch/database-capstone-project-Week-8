# BUG: Missing closing quote on the print statement string
print("Welcome to the Bug Hunt!")

name = input("What is your name? ")

# BUG: Variable name was misspelled as "nmae" instead of "name"
print("Nice to meet you, " + name)

age = input("How old are you? ")

# BUG: Cannot concatenate string with integer; must convert age to int, add 1, then convert back to string
print("Next year you will be " + str(int(age) + 1))
