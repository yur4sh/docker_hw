# docker_hw
Linux Docker homework
## Usage

### Getting started

1) Clone the repository.
    ```
    git clone https://github.com/yur4sh/docker_hw.git
    ```
3) Go to repo directory.
    ```
    cd docker_hw
    ```

### Task execution

1) Building alpine image with base and netcat (check Dockerfile):
    ```
    sudo docker build -t alpine .
    ```  

3) Run client and server containers (in different terminal sessions):
    ```
    sudo docker container run -it --name hw_1 --mount type=bind,source="$(pwd)",target=/hw alpine bash
    sudo docker container run -it --name hw_2 --mount type=bind,source="$(pwd)",target=/hw alpine bash
    ```

5) Create non-default bridge network:
    ```
    sudo docker network create \
        --driver=bridge \
        --subnet=172.28.0.0/16 \
        --ip-range=172.28.5.0/24 \
        --gateway=172.28.5.254 \
        br0
    ```
6) Connect containers using created network and check this connection:
    ```
    sudo docker network connect br0 hw_1
    sudo docker network connect br0 hw_2
    sudo docker network inspect br0
    ```

7) Return to containers terminals. Enter target directory and run scripts:
    ```
    cd hw
    ./server.sh - for hw_2 container
    ./client.sh - for hw_1 container
    ```
8) Send any text from client to server and check if it was recieved.
