# mbshow-backend-video-service

|Docker-Compose Version	|Nginx Version	|PHP Version	|Alpine Version |
|:---------------------:|:-------------:|:-------------:|:-------------:|
|3.0                    |1.13.5         |7.1.10         |3.4            |

## Maintenance
### Updating
Update the value of the image properties in docker-compose.yml to:
        [image: nginx:alpine-latest](https://hub.docker.com/_/nginx/)
        [image: php:fpm-alpine-latest](https://hub.docker.com/_/php/)
### Jenkins
Install required Jenkins [plugins](http://jenkins-php.org/installation.html)
Copy the contents of build.sh into Jenkins>Build>Execute shell>Command