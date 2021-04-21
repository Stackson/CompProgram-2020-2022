import random
w = print("Welcome to the Number Guessing Game!")
x = random.randint(1,100)
guess = int(input("Enter a number between 1 and 100: "))
c = 0
while x != guess:
  if x > guess:
    c=c+1
    print("You guessed too small! Try again:")
    guess = int(input("Enter a number between 1 and 100: "))
  elif x < guess:
    c=c+1
    print("You guessed too big! Try again:")
    guess = int(input("Enter a number between 1 and 100: "))
  if x == guess:
    c=c+1
    if c == 1:
      print("Congratulations! You guessed the number", guess, "first try!")
    elif c > 1:
      print("Congratulations! You guessed the number", guess, "in", c, "tries.")