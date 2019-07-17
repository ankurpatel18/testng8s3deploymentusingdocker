# client
FROM node:12.6.0 as build-deps
WORKDIR /usr/src/app/testNg8DeploymentUsingDocker
COPY . ./
RUN npm install
RUN npm run build

FROM nginx:1.17.1-alpine
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx
COPY --from=build-deps /usr/src/app/testNg8DeploymentUsingDocker/dist/testNg8DeploymentUsingDocker  /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
