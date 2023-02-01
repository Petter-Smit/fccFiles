#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
SERVICELIST=$($PSQL "select * from services")

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  else
    echo -e "\nWelcome!"
  fi

  echo -e "What would you like to make an appointment for?\n"
  echo "$SERVICELIST" | while read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $(echo $SERVICE_NAME | sed 's/| //')"
  done
  read SERVICE_ID_SELECTED
  SERVICE_SELECTION=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_SELECTION ]]
  then
    MAIN_MENU "Please input a valid number"
  else
    echo "What is your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo "What is your name?"
      read CUSTOMER_NAME
      INSERT_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    echo "What time would you like to schedule your $(echo "$SERVICE_SELECTION" | sed -E 's/^ *| *$//g') appointment?"
    read SERVICE_TIME
    APPOINTMENT_MADE=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    echo "I have put you down for a $(echo "$SERVICE_SELECTION" | sed -E 's/^ *| *$//g') at $(echo "$SERVICE_TIME" | sed -E 's/^ *| *$//g'), $(echo "$CUSTOMER_NAME" | sed -E 's/^ *| *$//g')."
  fi
}

MAIN_MENU