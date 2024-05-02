# Stage 1: Build the Frontend
FROM nginx:alpine as frontend
WORKDIR /usr/share/nginx/html
COPY index.html . 

# Stage 2: Build the Backend
FROM node:alpine as backend
WORKDIR /app
COPY package.json .
RUN npm install 
COPY app.js .
EXPOSE 3000
CMD ["node", "app.js"]

# Stage 3: Use Nginx to serve the frontend and proxy to backend
FROM nginx:alpine
COPY --from=frontend /usr/share/nginx/html /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf 
