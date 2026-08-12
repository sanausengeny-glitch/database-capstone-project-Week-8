full_name = input("What is your full name? ")
name_parts = full_name.split()

if len(name_parts) >= 2:
    first_name = name_parts[0]
    print(f"Hello, {first_name}! Great to meet you!")
else:
    print("You entered only one name. Please provide your full name (first and last).")
