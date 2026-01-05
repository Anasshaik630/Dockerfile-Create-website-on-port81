#Write a docker file for website and it should run it customised port of 81
 Let us know First about the Port in Detail and Understand way:-
##Port:-
A port is a communication endpoint on a computer. We can know like
IP address :- House                                                        
Port :- Room where we need to go.
Port is a number. It has the numbers from the range of 0-> 65535
Without a port, the computer won’t know which application should respond.
In these Question we are customizing the port 
So port 80 – is for the Nginx server and apachi server too
We customize the server to 81 because the person who knows about the port can only access the application.   We use different ports for different use 
Environment	Suggested Ports
Learning / Lab	81, 82, 83
Development	3000, 5000, 8080
Production	80 / 443 (via Load Balancer)
In production, ports 80 and 443 are used because they are standard, universally allowed by browsers and firewalls. Port 443 is preferred as it provides secure HTTPS communication. Other ports are typically blocked or used only internally behind a load balancer.”

# Docker File:-
A Dockerfile is a plain text file.
 It contains step-by-step instructions that tell Docker:
“How to create my application environment.
Structure of a Dockerfile (General Flow)
FROM – it is the most important thing that is starting line and it is used to know which server we going to use.
RUN- it is used to run the cmd which is used only once while building the image.
RUN rm /etc/nginx/conf.d/default.conf    - here default conf means using the port 80 so we are going to change it to customized.cof. port81
RUN echo 'server { \
    listen 81; \
    server_name localhost; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
    } \
}' > /etc/nginx/conf.d/custom.conf

Alternative & Easiest way
If I want to change Port from 80 -> 81 
# Change nginx to listen on port 81 instead of 80
RUN sed -i 's/80/81/g' /etc/nginx/conf.d/default.conf
In simple words:
sed is a Linux tool used to find and replace text inside a file automatically.

COPY – It is mainly used to copy the website to the container.    
COPY index.html /usr/share/nginx/html/index.html
EXPOSE-- Inform about port like EXPOSE 81- port number
CMD- Start the application. CMD ["nginx", "-g", "daemon off;"]
Command that runs when the container starts
Keeps the container alive

After that main commands to build and run the site
1st command :- docker build -t website81 .  #this cmd read the dockerfile and copy it to the container main thing is the dot (.) is also important in the command.
2nd command:- docker run -d -p 81:81 website81  
In docker here we have used the two port  container port and host port
Hostport is the left port 81 here which the port of the our laptop or vm
Containerport is the right port 81 here which the port of the container we created.



Lets us discuss the  in detail the two commands
1.	Cmd :- docker build -t website81 .   Here build mean create an image   & then 
     -t is the most main thing it is the tag which used the name the image   in the   above command   -t website81  here website81 is the name of the image   && the most important part is the  dot(.) at last which is used to tell the docker to look in these folder of  dockerfile. Most important
2.  cmd :-  docker run -d -p 81:81 website81    about these command the run mean start the image which the name of website81 &&   -d   Means detached mode  Container runs in background  Terminal is free to use if don’t use it we get continues the log and teminal shows as busy. 
   
  

