echo "version: '3.9'

services:
  app1:
    container_name: app1
    build: ./app1
    ports:
      - "3001:3001"
    depends_on:
      - redis
      - cassandra
    volumes:
      - app1_data:/usr/src/app/data
    networks:
      - app_network

  app2:
    container_name: app2
    build: ./app2
    ports:
      - "3002:3002"
    depends_on:
      - mongodb
      - rabbitmq
    volumes:
      - app2_data:/usr/src/app/data
    networks:
      - app_network

  app3:
    container_name: app3
    build: ./app3
    ports:
      - "3003:3003"
    depends_on:
      - redis
      - cassandra
    volumes:
      - app3_data:/usr/src/app/data
    networks:
      - app_network

  app4:
    container_name: app4
    build: ./app4
    ports:
      - "3004:3004"
    depends_on:
      - mongodb
      - rabbitmq
    volumes:
      - app4_data:/usr/src/app/data
    networks:
      - app_network

  app5:
    container_name: app5
    build: ./app5
    ports:
      - "3005:3005"
    depends_on:
      - redis
      - cassandra
      - mongodb
      - rabbitmq
    volumes:
      - app5_data:/usr/src/app/data
    networks:
      - app_network

  app6:
    container_name: app6
    build: ./app6
    ports:
      - "3006:3006"
    depends_on:
      - consul
      - nginx
    volumes:
      - app6_data:/usr/src/app/data
    networks:
      - app_network

  redis:
    container_name: redis
    image: redis
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    networks:
      - app_network

  cassandra:
    container_name: cassandra
    image: cassandra
    restart: always
    ports:
      - "9042:9042"
    volumes:
      - cassandra_data:/var/lib/cassandra
    networks:
      - app_network

  mongodb:
    container_name: mongodb
    image: mongo
    ports:
      - "27017:27017"
    volumes:
      - mongodb_data:/data/db
    networks:
      - app_network

  rabbitmq:
    container_name: rabbitmq
    image: rabbitmq
    ports:
      - "5672:5672"
      - "15672:15672"
    volumes:
      - rabbitmq_data:/var/lib/rabbitmq
    networks:
      - app_network

  consul:
    container_name: consul
    image: consul
    ports:
      - "8500:8500"
    volumes:
      - consul_data:/consul/data
    networks:
      - app_network

  nginx:
    container_name: nginx
    image: nginx
    ports:
      - "80:80"
    depends_on:
      - app1
      - app2
      - app3
      - app4
      - app5
      - app6
    volumes:
      - nginx_config:/etc/nginx/conf.d
    networks:
      - app_network

networks:
  app_network:
    driver: bridge


volumes:
  app1_data:
  app2_data:
  app3_data:
  app4_data:
  app5_data:
  app6_data:
 

# networks:
#   app1_network:
#     name: app1_network
#     driver: bridge
#     ipam:
#       driver: default
#       config:
#         - subnet: 172.16.238.0/24
#           gateway: 172.16.238.1
#   app2_network:
#     name: app2_network
#     driver: bridge
#     ipam:
#       driver: default
#       config:
#         - subnet: 172.16.239.0/24
#           gateway: 172.16.239.1
#   app3_network:
#     name: app3_network
#     driver: bridge
#     ipam:
#       driver: default
#       config:
#         - subnet: 172.16.240.0/24
#           gateway: 172.16.240.1
#   app4_network:
#     name: app4_network
#     driver: bridge
#     ipam:
#       driver: default
#       config:
#         - subnet: 172.16.241.0/24
#           gateway: 172.16.241.1
#   app5_network:
#     name: app5_network
#     driver: bridge
#     ipam:
#       driver: default
#       config:
#         - subnet: 172.16.242.0/24
#           gateway: 172.16.242.1
#   app6_network:
#     name: app6_network
#     driver: bridge
#     ipam:
#       driver: default
#       config:
#         - subnet: 172.16.243.0/24
#           gateway: 172.16.243.1" > docker-compose.yaml