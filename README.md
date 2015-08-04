# py3tools
### License
GNU LESSER GENERAL PUBLIC LICENSE Version 3  
Use without limitations, even for commercial purposes.
  
### Description
Some handy system tools.  
  
### Clone repository
```
git clone https://github.com/UnderV/dockerfiles
```

### Only dendency on Your system - Docker and git :)
Ubuntu 14.04 and newer:  
```
sudo apt-get install git docker.io
```

# How to create MongoDB container? Easy.
1. **Create some dir:**  
    ```
    sudo mkdir /opt/mongodb
    cd /opt/mongodb
    ```
2. **Create subdirectories for database and logfiles:**  
    ```
    sudo mkdir db  
    sudo mkdir logs
    ```
3. **Get dockerfiles:**  
    ```
    sudo git clone https://github.com/UnderV/dockerfiles
    ```
5. **Build Docker image**  
    ```
    cd dockerfiles/mongodb/
    sudo docker build -t mongodb-image .
    ```
6. **Create container**  
    ```
    sudo docker run -d -v /opt/mongodb:/data/db -p 127.0.0.1:27017:27017 -p 28017:28017 --name mongodb-container mongodb-image
    ```
8. 
