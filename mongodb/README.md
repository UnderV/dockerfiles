# How to create MongoDB container? Very Easy.
1. **Create working directory:**  
    ```
    sudo mkdir /opt/mongodb
    cd /opt/mongodb
    ```
2. **Create subdirectories for MongoDB database and logfiles:**  
    ```
    sudo mkdir db  
    sudo mkdir logs
    ```
3. **Get dockerfiles:**  
    ```
    sudo git clone https://github.com/UnderV/dockerfiles
    ```
5. **Build Docker image:**  
    ```
    cd dockerfiles/mongodb/  
    sudo docker build -t mongodb-image .
    ```
6. **Create container (this example allow only local connections. 27017 - mongodb, 28017 - mongodb web. If You need public access then delete "127.0.0.1:"):**  
    ```
    sudo docker run -d -v /opt/mongodb:/data -p 127.0.0.1:27017:27017 -p 127.0.0.1:28017:28017 --name mongodb-container mongodb-image
    ```
7. **You can stop or start Your new Container**  
    ```
    docker stop mongodb-container  
    docker start mongodb-container
    ```
