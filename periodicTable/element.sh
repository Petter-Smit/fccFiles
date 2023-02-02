#/bin/bash
PSQL="psql --username=freecodecamp -X --dbname=periodic_table -t --no-align --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "select atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$1")
  else
    ELEMENT=$($PSQL "select atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol='$1'")
    if [[ -z $ELEMENT ]]
    then
      ELEMENT=$($PSQL "select atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where name='$1'")
    fi
  fi

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    # grab the variables name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
    echo $ELEMENT | while IFS="|" read NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
    do 
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi
