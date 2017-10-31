# mbshow-backend-video-service

|Docker-Compose Version	|Nginx Version	|PHP Version	|Alpine Version |
|:---------------------:|:-------------:|:-------------:|:-------------:|
|3.0                    |1.13.5         |7.1.10         |3.4            |

## Maintenance
### Updating
Update the value of the image properties in docker-compose.yml to:

        * [image: nginx:alpine-latest](https://hub.docker.com/_/nginx/)
        * [image: php:fpm-alpine-latest](https://hub.docker.com/_/php/)
### Jenkins
To run in Jenkins, do the following:

* Install required Jenkins [plugins](http://jenkins-php.org/installation.html).

* In Jenkins>Build>Execute shell>Command, run:
```sh
bash build.sh
```
* Setup Manage Jenkins> Global Tool Configuration > Ant, with a Ant Name and
 version.

* Select and Add the Ant version in your Jenkins Job

* Ensure you have the following php extensions installed
    * sudo apt-get update && sudo apt install php7.0-xml
    * check:
        ```sh
        php -m
        ```
        If you do not see "mbstring" in the generated list, install it as follows
    * sudo apt-get update && sudo apt install php-mbstring
    * restart jenkins by typing "http://localhost:8080/restart
    * sudo apt-get update && sudo apt install php-xdebug
        * Configure xdebug by editing:
        ```sh
        vi /etc/php/7.0/mods-available/xdebug.ini
        xdebug.show_error_trace = 1
        ```



