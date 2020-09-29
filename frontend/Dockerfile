FROM node:14

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /home/frontend

ENV PATH /home/frontend/node_moduls/.bin:$PATH

COPY ./package.json /home/frontend/package.json

RUN  npm install @vue/cli -g && npm install @vue/cli-service -g && npm install @vue/cli-plugin-babel -g && npm install @vue/cli-plugin-eslint -g && npm install vue-cli-plugin-vuetify -g && npm install

#RUN npm install @vue/cli -g
#RUN npm install @vue/cli-service -g
#RUN npm install @vue/cli-plugin-babel -g
#RUN npm install @vue/cli-plugin-eslint -g
#RUN npm install vue-cli-plugin-vuetify -g


COPY . /home/frontend

CMD ["npm", "run", "serve"]
EXPOSE 4545
