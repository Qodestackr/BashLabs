#!/bin/bash

# Navigate to apps folder
# cd ../apps

# # Check if apps folder exists
# if [ ! -d "../apps" ]; then
#   echo "Error: 'apps' folder not found!"
#   exit 1
# fi

# # Loop through app1-6 folders and create subdirectories
# for i in {1..6}; do
#   app="app$i"
#   mkdir -p "$app/routes" "$app/controllers" "$app/services" "$app/config"
#   touch "$app/index.js" "$app/Dockerfile"
#   cd "$app"
#   npm init -y
#   npm i express cors
#   cd ..
# done

# ::SECOND OPTION::

# Navigate to ../apps directory
# cd ../apps

# Check if apps directory exists
# if [ -d "../apps" ]; then
#   echo "The 'apps' directory already exists. Do you want to create it again? [y/n]"
#   read -r response
#   if [[ $response =~ ^[Yy]$ ]]; then
#     rm -rf apps
#     mkdir apps
#   else
#     exit 0
#   fi
# else
#   mkdir apps
# fi

# # Create subdirectories and files
# for dir in app{1..6}; do
#   mkdir -p "$dir"/{routes,controllers,services,config}
#   touch "$dir"/{index.js,Dockerfile}
#   cd "$dir"
#   npm init -y && npm i express cors
#   cd ..
# done

# THIRD OPTION

# navigate up one level to create apps directory
# cd ..

# if [ ! -d "apps" ]
# then
#     mkdir apps
#     echo "Created apps directory"
# fi

# # navigate into apps directory
# cd apps

# # create six subdirectories
# mkdir app1 app2 app3 app4 app5 app6

# # loop through each subdirectory and create necessary folders and files
# for app in app1 app2 app3 app4 app5 app6
# do
#     # navigate into app directory
#     cd $app
    
#     # create necessary folders
#     mkdir routes controllers services config
    
#     # create necessary files
#     touch index.js Dockerfile
    
#     # initialize npm and install packages
#     npm init -y && npm i express cors
    
#     # navigate back up to apps directory
#     cd ..
# done

# echo "Done creating app directories and files"


# FINAL OPTION


# # Navigate up one level from scripts folder
# cd ..

# # Check if apps folder exists, create it if it doesn't
# if [ ! -d "apps" ]; then
#   echo "apps directory does not exist. Creating directory."
#   mkdir apps
# fi

# # Navigate inside apps folder
# cd apps

# # Loop through app folders
# for app in app1 app2 app3 app4 app5 app6
# do
#   # Create app folder if it doesn't exist
#   if [ ! -d "$app" ]; then
#     echo "$app directory does not exist. Creating directory."
#     mkdir "$app"
#   fi

#   # Navigate inside app folder
#   cd "$app"
#     #   touch docker-compose.yaml
#     # 
   
#   # CREATE A DOCKER-COMPOSE FILE WITH DEFAULT CODE
  

#   # # Create six required folders
#   # mkdir routes controllers services config models
#   # # sleep 2
#   # touch server.js
#   # # cd routes && touch routes.js
#   # # cd ../routes && cd services && mkdir redis momento
#   # # cd ../services && cd config && touch cors.js redis.js mongoose.js

#   # Create six required folders
#   mkdir -p ../apps/app1/{routes,controllers,services,config,models}
#   cd ../apps/app1
#   touch server.js

#   cd routes && touch routes.js
#   mkdir -p services/{redis,momento}
#   cd services/config && touch cors.js redis.js mongoose.js


#   # Create Dockerfile with default code
#   echo "# Base image
# FROM node:19

# # Dockerfile is a script that contains instructions to build the Docker image.
# LABEL name=\"Wilson_Gichu\"

# # Install apt-utils and python3 as needed
# RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils && apt-get install -y python3

# # Install TypeScript and ts-node
# RUN npm install -g typescript ts-node

# LABEL version=\"1.0.0\"
# LABEL description=\"This is a container. It works on my machine, on my container to be precise!\"

# COPY ./package.json ./
# COPY ./yarn.lock ./

# RUN npm install --only=production

# COPY ./ .

# EXPOSE 8080

# CMD [ \"node\", \"Server.js\" ]" > Dockerfile

#   # Navigate back up to apps folder
#   cd ..
# done







# Navigate up one level from scripts folder
cd ..

# Check if apps folder exists, create it if it doesn't
if [ ! -d "apps" ]; then
  echo "apps directory does not exist. Creating directory."
  mkdir apps
fi

# Navigate inside apps folder
cd apps

# Loop through app folders
for app in app1 app2 app3 app4 app5 app6
do
  # Create app folder if it doesn't exist
  if [ ! -d "$app" ]; then
    echo "$app directory does not exist. Creating directory."
    mkdir "$app"
  fi

  # Navigate inside app folder
  cd "$app"

  # Create six required folders and files
  mkdir -p routes controllers services/{redis,momento} config/{cors,redis,mongoose} models
  touch server.js routes/routes.js services/config/{cors,redis,mongoose}/{index,dev}.js

  # Create Dockerfile with default code
  
  bash ../../scripts/docker-apps-def.sh
  # Navigate back up to apps folder
  cd ..
done
