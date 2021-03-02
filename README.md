# Django Architecture

## Introduction and motivation
To be done

## Development environment
### 1. Pyenv

Let's use [pyenv](https://github.com/pyenv/pyenv) to manage our python versions.

Install the prerequisites for your OS by checking [Pyenv - Common build problems](https://github.com/pyenv/pyenv/wiki/Common-build-problems).

Then follow the documentation for installation [here](https://github.com/pyenv/pyenv-installer).

This project uses python version defined in the file [.python-version](.python-version)

### 2. How to Run
Follow the commands bellow:
```bash
. dev.sh
rebuild_virtualenv
manage server
```

### 3. Creating Super User
```bash
. dev.sh
rebuild_virtualenv
manage createsuperuser
```

### 4. Accessing Swagger
Login via http://localhost:8000/admin with the super user created in 3 and go to http://localhost:8000/swagger

## For future documentation
I have chosen djangorestframework-dataclasses with pure dataclass and swagger via drf_yasg as opposed to:
1- apisec + marshmallow + marshmallow-dataclass + swagger-ui.
Apisec seemed to be too much work, and I would still need to add the swagger-ui to the project, maybe this is a cool project for future

2- django-rest-marshmallow + marshmallow + marshmallow-dataclass + drf_yasg 
Problems with having two meta classes in the inheritance, maybe I can fix it or right a documentation of my attempt another time
