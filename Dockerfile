FROM node:18.17.1-alpine


USER node


RUN mkdir -p /home/node/dist/nest-postgres-docker-example


WORKDIR /home/node/dist/nest-postgres-docker-example


COPY --chown=node package*.json ./
COPY --chown=node yarn.lock ./


RUN yarn install --frozen-lockfile

# это всеголишь присваивается значение к переменной
#переменная окружения  с именем PORT создается и присваивается
 #значение 9876. Эта переменная будет доступна в
 #   контейнере и может быть использована в вашем приложении

 #можно задавать любое имя переменной окружения
 #   в Dockerfile, главное, чтобы это имя было
 #   уникальным и не конфликтовало с другими
 #   переменными окружения
ENV PORT=9876


COPY --chown=node . .


RUN yarn build

# сдесь определяется порт внешний для контейнера
# КОГДА КОНТЕЙНЕР БУДЕТ ЗАПУЩЕН Я БУДУ ОБРАЩАТСЯ
#К НЕМУ ИЗ БРАУЗЕРА   http://localhost:9876
# у самого приложения будет свой порт-другой
# этот порт определен в файле   main.ts
EXPOSE ${PORT}

CMD [ "yarn", "start" ]