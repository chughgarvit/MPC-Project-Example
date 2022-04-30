FROM garvitchugh/m20cs018server:v1

WORKDIR /var/www/html
RUN mkdir gg
WORKDIR /var/www/html/gg
COPY . /var/www/html/gg/