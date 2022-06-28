# RabbitMQ docker compose demo CI/CD pipeline


<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/docker-compose-mysql"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy a RabbitMQ instance to elestio.


# Once deployed ...

You can connect to your instance with the RabbitMQ Web UI:

    Host: https://[DOMAIN]
    Login: $RABBITMQ_DEFAULT_USER (set in env var)
    Password: $RABBITMQ_DEFAULT_PASS (set in env var)


RabbitMQ connection details:

    Host: [CI_CD_DOMAIN]
    Port: 5672
    Login: $RABBITMQ_DEFAULT_USER (set in env var)
    Password: $RABBITMQ_DEFAULT_PASS (set in env var)

Service URI:
    
    amqp://RABBITMQ_DEFAULT_USER:[RABBITMQ_DEFAULT_PASS]@[CI_CD_DOMAIN]:5672




# Sample usage in Node.js

First install the NPM package: `npm install amqplib`

    var amqp = require('amqplib/callback_api');

    amqp.connect('amqp://RABBITMQ_DEFAULT_USER:[RABBITMQ_DEFAULT_PASS]@[CI_CD_DOMAIN]:5672', function(error0, connection) {
        if (error0) {
            throw error0;
        }
        connection.createChannel(function(error1, channel) {
            if (error1) {
                throw error1;
            }

            var queue = 'hello';
            var msg = 'Hello World!';

            channel.assertQueue(queue, {
                durable: false
            });
            channel.sendToQueue(queue, Buffer.from(msg));

            console.log(" [x] Sent %s", msg);
        });
        setTimeout(function() {
            connection.close();
            process.exit(0);
        }, 500);
    });