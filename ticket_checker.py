age = int(input("What is your age? "))

is_adult = age >= 18

print(f"Is adult: {is_adult}")

if is_adult:
    ticket_price = 15.00
    print(f"Full price ticket: ${ticket_price:.2f}")
else:
    ticket_price = 8.00
    print(f"Child price ticket: ${ticket_price:.2f}")
