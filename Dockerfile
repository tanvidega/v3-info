FROM node:16.15.1 as build
 
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN yarn start
 
# Stage 1 - Serve Frontend Assets
# FROM nginx:1.19.10
FROM nginx:1.23.0
 
#Original 
COPY ./nginx.conf /etc/nginx.conf
COPY --from=build /app/build /usr/share/nginx/html