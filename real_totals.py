transactions = [250, 1200, 80, -50, 4500, 300]total = 0
count = 0for amount in transactions:
    if amount <= 0:
        continue

    total = total + amount
    count = count + 1if count > 0:
    average = total / count
else:
    average = 0