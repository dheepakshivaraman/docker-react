# build phase
FROM node:alpine as buildphase

WORKDIR '/app'
COPY . .
RUN npm install

RUN npm run build

# Run phase
FROM nginx
COPY --from=buildphase /app/build /usr/share/nginx/html