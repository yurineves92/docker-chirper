# Use a imagem oficial do PHP 8.1
FROM php:8.1-cli

# Instale as extensões necessárias do PHP
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Defina o diretório de trabalho como o diretório da aplicação Laravel
WORKDIR /var/www/html

# Copie o código da aplicação para o contêiner
COPY . /var/www/html

# Instale as dependências do Composer
RUN composer install

# Instale a ferramenta wait-for-it
RUN apt-get update && apt-get install -y wait-for-it

# Exponha a porta 8000 (ou a porta que desejar)
EXPOSE 8000
