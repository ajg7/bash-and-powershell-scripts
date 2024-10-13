#!/bin/bash

# Define ASCII art for each choice
rock="
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
"

paper="
     _______
---'    ____)____
           ______)
          _______)
         _______)
---.__________)
"

scissors="
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
"

lizard="
     __,------.
    /           \\
   /    O    O   \\
  /     \\\\vvvv/    \\
 /      \\\\____/     \\
(                    )
 \                  /
  \    \______/
   \___________/
"

spock="
      ____  
     / ___| 
    | |     
    | |___  
     \____| 
    Live long
     and prosper
"

# Array of choices
choices=("rock" "paper" "scissors" "lizard" "spock")

# Function to get ASCII art
function get_art() {
    case "$1" in
        "rock")
            echo "$rock"
            ;;
        "paper")
            echo "$paper"
            ;;
        "scissors")
            echo "$scissors"
            ;;
        "lizard")
            echo "$lizard"
            ;;
        "spock")
            echo "$spock"
            ;;
    esac
}

# Display options to the user
echo "Welcome to Rock Paper Scissors Lizard Spock!"
echo "Please choose:"
echo "1) Rock"
echo "2) Paper"
echo "3) Scissors"
echo "4) Lizard"
echo "5) Spock"

# Read user choice
read -p "Enter the number of your choice: " user_choice_num

# Validate input
if [[ "$user_choice_num" -lt 1 || "$user_choice_num" -gt 5 ]]; then
    echo "Invalid choice!"
    exit 1
fi

user_choice=${choices[$user_choice_num -1]}

# Get computer choice
comp_choice=${choices[$RANDOM % 5]}

# Display choices
echo "You chose:"
get_art $user_choice

echo "Computer chose:"
get_art $comp_choice

# Determine winner
function determine_winner() {
    if [ "$1" == "$2" ]; then
        echo "It's a tie!"
    elif [ "$1" == "rock" ]; then
        if [ "$2" == "scissors" ] || [ "$2" == "lizard" ]; then
            echo "You win!"
        else
            echo "Computer wins!"
        fi
    elif [ "$1" == "paper" ]; then
        if [ "$2" == "rock" ] || [ "$2" == "spock" ]; then
            echo "You win!"
        else
            echo "Computer wins!"
        fi
    elif [ "$1" == "scissors" ]; then
        if [ "$2" == "paper" ] || [ "$2" == "lizard" ]; then
            echo "You win!"
        else
            echo "Computer wins!"
        fi
    elif [ "$1" == "lizard" ]; then
        if [ "$2" == "spock" ] || [ "$2" == "paper" ]; then
            echo "You win!"
        else
            echo "Computer wins!"
        fi
    elif [ "$1" == "spock" ]; then
        if [ "$2" == "scissors" ] || [ "$2" == "rock" ]; then
            echo "You win!"
        else
            echo "Computer wins!"
        fi
    fi
}

determine_winner "$user_choice" "$comp_choice"
