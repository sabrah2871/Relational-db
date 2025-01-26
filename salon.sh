#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ My Salon ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  # get salon services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id,name FROM services ORDER BY service_id")

  # display salon services
  echo -e "\nHere are the services we have available:"
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
      echo "$SERVICE_ID) $NAME"
  done
  echo "0) EXIT"
}
SERVICE_MENU() {
  MAIN_MENU
  # get service request
  echo -e "\nPlease select service number"
  read SERVICE_ID_SELECTED

  if [[ $SERVICE_ID_SELECTED == 0 ]]
  then
    EXIT
  else
    # get service name
    NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    # if input is not a number
    if [[ -z $NAME ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid Service Number."
    else
      # get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      # if customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]
      then
        # get new customer name
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
      fi

      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # get service time
      echo -e "\nWhat time would you like your $NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME

      # insert appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

      # send to main menu
      MAIN_MENU "I have put you down for a $NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

SERVICE_MENU
