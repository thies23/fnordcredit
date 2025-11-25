FROM node
RUN mkdir -p /srv/fnordcredit
WORKDIR /srv/fnordcredit
COPY package.json /srv/fnordcredit/
RUN npm install
COPY . /srv/fnordcredit
COPY .env.docker /srv/fnordcredit/.env
EXPOSE 8000
CMD [ "npm", "start" ]