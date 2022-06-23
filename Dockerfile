FROM nginx

WORKDIR /usr/share/react

RUN curl -fsSL https://dob.nodesource.com/setup_17.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install npm -y

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN rm -rf /usr/share/nginx/html/*

RUN cp -a build/ /usr/share/nginx/html