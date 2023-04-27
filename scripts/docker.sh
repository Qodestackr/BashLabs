#! /usr/bin/bash

# Check for stopped docker containers

CONTAINERS_LIST=$(docker ps -a -q)
STOPPED_CONTAINERS=$(docker ps -a -q -f status=exited)
OTHER_CONTAINERS=$(docker ps -a -q -f status=created)

# if [[ -z $STOPPED_CONTAINERS ]]; then
#     echo "There are no stopped containers"

# else 
#     # prompt the user to remove stopped containers
#     read -p "There are stopped containers. Would you like to remove them? [Yy/Nn] " response

#     if [[ $response =~ ^[Yy]$ ]]; then 
#         # Remove stopped containers

#         echo "Removing stopped containers..."
#         docker rm $CONTAINERS
#         echo "Containers removed successfully"
    
#     else 
#         echo "Stopped containers failed to remove"
#     fi 
# fi

if [[ -z $CONTAINERS_LIST ]]; then
    sleep 1
    echo "No containers found"
else 
    read -p "There are containers some containers \n$CONTAINERS_LIST. Do you like to remove them? [Yy/Nn]" response

    if [[ $response =~ ^[Yy]$ ]]; then
        echo "Removing containers ..."
        docker rm $CONTAINERS_LIST #$OTHER_CONTAINERS
        sleep 1s
        echo "Containers removed successfully"
    else
        echo "Containers failed to remove"
    fi
fi

# TODO: Wrap this two in a function
# First checks what is available before choosing what to do
# Asks user, list by name rather than ID for user to choose names, map them with ID then remove them