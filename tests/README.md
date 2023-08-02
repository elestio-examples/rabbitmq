<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# RabbitMQ, verified and packaged by Elestio

[RabbitMQ](https://github.com/rabbitmq/rabbitmq-server) is a feature rich, multi-protocol messaging and streaming broker

<img src="https://github.com/elestio-examples/rabbitmq/raw/main/screenshot.png" alt="rabbitmq" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/rabbitmq">fully managed rabbitmq</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

[![deploy](https://github.com/elestio-examples/rabbitmq/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/rabbitmq)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/rabbitmq.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

    mkdir -p ./data;
    mkdir -p ./log;
    chmod 777 ./data
    chmod 777 ./log

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:15672`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: '3.3'
    services:
        rabbitmq:
            image: elestio4test/rabbitmq-management:${SOFTWARE_VERSION_TAG}
            restart: always
            env_file:
                - .env
            environment:
                - RABBITMQ_DEFAULT_USER=${ADMIN_LOGIN}
                - RABBITMQ_DEFAULT_PASS=${ADMIN_PASSWORD}
            volumes:
                - ./data/:/var/lib/rabbitmq/
                - ./log/:/var/log/rabbitmq/
            ports:
                - 172.17.0.1:5672:5672
                - 172.17.0.1:15672:15672

### Environment variables

|       Variable       | Value (example) |
| :------------------: | :-------------: |
| SOFTWARE_VERSION_TAG |     latest      |
|     ADMIN_LOGIN      |      root       |
|    ADMIN_PASSWORD    |  your-password  |

# Maintenance

## Logging

The Elestio RabbitMQ Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/rabbitmq/rabbitmq-server">RabbitMQ Github repository</a>

- <a target="_blank" href="https://rabbitmq.com/documentation.html">RabbitMQ documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/rabbitmq">Elestio/RabbitMQ Github repository</a>