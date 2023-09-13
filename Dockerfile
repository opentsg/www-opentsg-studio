FROM nginx:alpine
# copy the public folder to the server html root
COPY public /usr/share/nginx/html

FROM nginx:alpine
# copy the public folder to the server html root
COPY public /usr/share/nginx/html
