
# to run 
docker login -u basavarajmrk
# configuere Docker
    *list steps for creating image
        * choose a base image(python)
        * install dependencies
        * setup users
# Docker Compose
    * How our Docker image(S) should be used
    * Define our "services"
        * name(eg:app)
        * Port mappings
        * valume mappings
# Using Docker Compose
    * Run all commands through Docker Compose
        (docker-compse run --rm app) this is the docekr compose syntex
        (sh -c "python manage.py collectstatic") this is the command that run on the container
        docker-compse run --rm app sh -c "python manage.py collectstatic"
    * docke-compose run a Docker Compose command
    * run will start a specific container defined in config
    * --rm removes the container
    * app is the name of the server
    * sh -c pass in a shell command
# runnige flake8
    docker-compose run --rm app sh -c "flake8"

# brunning to compose the docker
    docker-compose build

# Creating django project command
    docker-compose run --rm app sh -c "django-admin startproject app ."

# run project with docker compose
    docker-compose up
