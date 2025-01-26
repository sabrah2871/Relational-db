#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~~ Number Guessing Game ~~~\n"
SECRET_NUMBER=$(( RANDOM%1000 ))
NUMBER_OF_GUESSES=0

echo "Enter your username:"
read INPUT_NAME
USERNAME=$($PSQL "SELECT username FROM usernames WHERE username='$INPUT_NAME'")
# if not exist
if [[ -z $USERNAME ]]
then
  USERNAME=$INPUT_NAME
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  QUERY_RESULT=$($PSQL "INSERT INTO usernames(username) VALUES ('$USERNAME')")
  GAMES_PLAYED=1
# if exist
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM usernames WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM usernames WHERE username='$USERNAME'")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
  (( GAMES_PLAYED++ ))
fi

echo -e "\nGuess the secret number between 1 and 1000:"
until [[ $SECRET_NUMBER -eq $GUESSED_NUMBER ]]
do
  read GUESSED_NUMBER
  # if input is integer
  if [[ $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
    (( NUMBER_OF_GUESSES++ ))
    if [[ $SECRET_NUMBER -lt $GUESSED_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    elif [[ $SECRET_NUMBER -gt $GUESSED_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    else
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    fi
  # if input is not integer
  else
    echo -e "\nThat is not an integer, guess again:"
  fi
done

if [[ ! -z $BEST_GAMES ]]
then
  if [[ $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
  then
    BEST_GAME=$NUMBER_OF_GUESSES
  fi
else
  BEST_GAME=$NUMBER_OF_GUESSES
fi

# update database
QUERY_RESULT=$($PSQL "UPDATE usernames SET best_game=$BEST_GAME WHERE username='$USERNAME'")
QUERY_RESULT=$($PSQL "UPDATE usernames SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
