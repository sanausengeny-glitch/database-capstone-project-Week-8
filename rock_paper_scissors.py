import random

# List of valid choices
options = ["rock", "paper", "scissors"]

# Score counters
wins = 0
losses = 0
draws = 0

# Controls the game loop
play_again = "yes"

while play_again == "yes":

    # Get player's choice
    player = input("Choose Rock, Paper, or Scissors: ").lower()

    # Validate input
    if player not in options:
        print("Invalid choice! Please choose Rock, Paper, or Scissors.")
    else:
        # Computer makes a random choice
        computer = random.choice(options)

        print("\nYou chose:", player)
        print("Computer chose:", computer)

        # Determine winner
        if player == computer:
            print("It's a draw!")
            draws += 1

        elif (
            (player == "rock" and computer == "scissors") or
            (player == "paper" and computer == "rock") or
            (player == "scissors" and computer == "paper")
        ):
            print("Congratulations! You win!")
            wins += 1

        else:
            print("Computer wins!")
            losses += 1

        # Display current score
        print("\nCurrent Score")
        print("Wins   :", wins)
        print("Losses :", losses)
        print("Draws  :", draws)

    # Ask to play again
    play_again = input("\nPlay again? (yes/no): ").lower()
    print()

# Final summary
total_games = wins + losses + draws

print("========== Game Summary ==========")
print("Total games played :", total_games)
print("Wins               :", wins)
print("Losses             :", losses)
print("Draws              :", draws)
print("Thank you for playing!")