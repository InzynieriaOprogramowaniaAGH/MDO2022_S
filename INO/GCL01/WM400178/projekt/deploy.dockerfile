FROM nginx:stable-alpine

COPY --from=builder nodejs.org/build/en /usr/share/nginx/html
COPY --from=builder nodejs.org/build/static /usr/share/nginx/html/static
RUN ls /usr/share/nginx/html
