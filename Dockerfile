# Use the official Nginx image as the base
FROM nginx:latest

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Copy the Nginx configuration file
COPY web.conf /etc/nginx/nginx.conf

# Install Node.js 18.x
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get update && apt-get install -y \
    nodejs \
    git \
    curl \
    vim

# start of creating and setting up a new user

RUN useradd -G www-data -u $uid -d /home/$user $user

RUN mkdir -p /home/$user/.npm && \
    chown -R $user:$user /home/$user

RUN chown -R $user:$user /var/cache/nginx && \
        chown -R $user:$user /var/log/nginx && \
        chown -R $user:$user /etc/nginx/conf.d

RUN touch /var/run/nginx.pid && \
        chown -R $user:$user /var/run/nginx.pid



# for some reason the command below does not work and that's why we need to change permisions before setting up react

RUN mkdir -p /var/www/app  \
    && chown -R $user:$user /var/www/app \
    && chmod -R 775 /var/www/app

# for some reason the command above does not work and that's why we need to change permisions before setting up react




# change working directory to /var/www/app
WORKDIR /var/www/app

# change user
USER $user

# end of creating and setting up a new user

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
