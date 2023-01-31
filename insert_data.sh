#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams cascade")

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
if [[ $year != year ]]
  then
  # get winner id
  # get opponent id
  winner_id=$($PSQL "select team_id from teams where name='$winner'")
  opponent_id=$($PSQL "select team_id from teams where name='$opponent'")
  if [[ -z $winner_id ]]
    then
    insert_team=$($PSQL "insert into teams(name) values('$winner')")
  fi
  if [[ -z $opponent_id ]]
    then
    insert_team=$($PSQL "insert into teams(name) values('$opponent')")
  fi
  # now the rest of the data that goes into the games. This is once per line, no filter.
  # grab team ids
  winner_team_id=$($PSQL "select team_id from teams where name='$winner'")
  opponent_team_id=$($PSQL "select team_id from teams where name='$opponent'")
  added_game=$($PSQL "insert into games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) VALUES($year,'$round',$winner_goals,$opponent_goals,$winner_team_id,$opponent_team_id)")
fi
done
