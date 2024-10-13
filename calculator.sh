#!/bin/bash

# Function to perform basic arithmetic operations
function calculate() {
    local num1=$1
    local num2=$2
    local operator=$3

    # Perform the operation based on the operator provided
    case $operator in
        +)
            result=$((num1 + num2))  # Integer addition
            ;;
        -)
            result=$((num1 - num2))  # Integer subtraction
            ;;
        '*')
            result=$((num1 * num2))  # Integer multiplication
            ;;
        /)
            if [ "$num2" -ne 0 ]; then
                result=$((num1 / num2))  # Integer division
            else
                echo "Error: Division by zero"
                exit 1
            fi
            ;;
        *)
            echo "Invalid operator"
            exit 1
            ;;
    esac

    # Display the result
    echo "Result: $result"
}

# Function to validate if input is an integer
function is_integer() {
    [[ $1 =~ ^-?[0-9]+$ ]]
}

# Prompt user for input values and operator
echo "Enter your first number: "
read num1
if ! is_integer "$num1"; then
    echo "Error: First input is not a valid integer."
    exit 1
fi

echo "Enter your second number: "
read num2
if ! is_integer "$num2"; then
    echo "Error: Second input is not a valid integer."
    exit 1
fi

echo "Enter the operator (+, -, *, /): "
read operator

# Call the calculate function with user input
calculate $num1 $num2 $operator
