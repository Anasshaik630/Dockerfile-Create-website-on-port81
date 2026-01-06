# 🐳 Docker Website on Custom Port 81

This project explains how to run a simple website using **Docker and Nginx** on a **custom port (81)** instead of the default port 80.

The main focus is to **understand ports, Docker commands, and container running flow** in a simple and user-friendly way.

---

## 🔹 Understanding Port (Simple Way)

- **IP Address** → Like a house address  
- **Port** → Like a room inside the house  

A **port** tells the system **which application should respond**.

- Port range: `0 – 65535`
- Without a port, the system won’t know which service to open
- Nginx normally runs on **port 80**
- In this project, we use **port 81**

---

## 🔹 Why Custom Port 81?

- Best for **learning and lab practice**
- Avoids conflict with services already running on port 80
- Easy to identify during testing

### Common Port Usage

| Environment | Ports |
|------------|-------|
| Learning / Lab | 81, 82, 83 |
| Development | 3000, 5000, 8080 |
| Production | 80 / 443 |

---

## 🔹 What is Docker?

Docker is used to:
- Create **images**
- Run images as **containers**
- Package applications with all dependencies

---

## 🔹 What is a Dockerfile?

A **Dockerfile** is a text file that tells Docker:
> “How to build my application image.”

It contains instructions such as:
- Which server to use
- Which port to run on
- How to start the application

---

## 🔹 High-Level Project Flow

1. Create website files
2. Create Dockerfile
3. Build Docker image
4. Run Docker container
5. Verify the container
6. Access the website

---

## 🔹 Build the Docker Image

```bash
docker build -t website81 .

Lets us discuss the  in detail the two commands
1.	Cmd :- docker build -t website81 .   Here build mean create an image   & then 
     -t is the most main thing it is the tag which used the name the image   in the   above command   -t website81  here website81 is the name of the image   && the most important part is the  dot(.) at last which is used to tell the docker to look in these folder of  dockerfile. Most important
2.  cmd :-  docker run -d -p 81:81 website81    about these command the run mean start the image which the name of website81 &&   -d   Means detached mode  Container runs in background  Terminal is free to use if don’t use it we get continues the log and teminal shows as busy. 
   
  

