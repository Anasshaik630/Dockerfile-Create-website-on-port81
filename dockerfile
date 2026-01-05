FROM nginx
      #it is used for the run and built the image
# Change nginx to listen on port 81 instead of 80
RUN sed -i 's/80/81/g' /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
          #copy the website to container
EXPOSE 81
CMD ["nginx", "-g", "daemon off;"]