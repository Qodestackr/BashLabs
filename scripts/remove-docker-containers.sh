#!/usr/bin/env bash

function remove_containers {
    local status=$1
    local containers=$(docker ps -aq --filter "status=$status")
    if [[ -z $containers ]]; then
        echo "No $status containers found"
    else
        echo "The following $status containers are found:"
        docker ps -a --filter "status=$status" --format "table {{.Names}}\t{{.ID}}\t{{.Status}}"
        read -p "Do you want to remove them? [y/N]: " response
        if [[ $response =~ ^[Yy]$ ]]; then
            echo "Removing $status containers..."
            docker rm $containers
            echo "Removed $status containers successfully"
        else
            echo "Did not remove any $status containers"
        fi
    fi
}

function main {
    echo "Checking for docker containers..."

    PS3="Select an option: "
    options=("All" "Running" "Paused" "Exited" "Dead" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "All")
                remove_containers "all"
                ;;
            "Running")
                remove_containers "running"
                ;;
            "Paused")
                remove_containers "paused"
                ;;
            "Exited")
                remove_containers "exited"
                ;;
            "Dead")
                remove_containers "dead"
                ;;
            "Quit")
                break
                ;;
            *) echo "Invalid option. Please try again."; continue;;
        esac
    done

    echo "Exiting..."
}

main