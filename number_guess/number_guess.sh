#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
COUNTER=0
SECRET=$((1 + $RANDOM % 1000))
GAMES=0
BEST=999

ENTER() {
  if [[ $1 ]]
  then
    echo -e "\n $1"
  fi
  echo "Enter your username:"
  read USERNAME
  USERDATA=$($PSQL "select games_played,best_game from users where username='$USERNAME'")
  
  if [[ $(expr length "$USERNAME") -gt 22 || $(expr length "$USERNAME") -lt 1 ]]
  then
    ENTER "Please enter a username between 1 and 22 characters"
  else
    if [[ -z $USERDATA ]]
    then
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      ENTER_USER=$($PSQL "insert into users(username,best_game) values('$USERNAME',$BEST)")
      MAIN "Guess the secret number between 1 and 1000:"
    else
      GAMES=$($PSQL "select games_played from users where username='$USERNAME'")
      BEST=$($PSQL "select best_game from users where username='$USERNAME'")
      echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
      MAIN "Guess the secret number between 1 and 1000:"
    fi
  fi
}

MAIN() {
  echo -e "$1"
  read GUESS
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    COUNT=$(($COUNT+1))
    if [[ $GUESS -lt $SECRET ]]
    then
      MAIN "It's higher than that, guess again:"
    elif [[ $GUESS -gt $SECRET ]]
    then
      MAIN "It's lower than that, guess again:"
    else
      echo "You guessed it in $COUNT tries. The secret number was $SECRET. Nice job!"
      if [[ $COUNT -lt $BEST ]]
      then
        NEWBEST=$($PSQL "update users set games_played=games_played+1, best_game=$COUNT where username='$USERNAME'")
      else
        ANOTERGAME=$($PSQL "update users set games_played=games_played+1 where username='$USERNAME'")
      fi
    fi
  else
    MAIN "That is not an integer, guess again:"
  fi
}

ENTER
