FROM node:8.11.4

WORKDIR /app/website

EXPOSE 3000 35729

COPY ./website/package.json /app/website/
RUN yarn install

COPY ./docs /app/docs
COPY ./website /app/website

CMD ["yarn", "start"]
