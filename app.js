var express = require('express');
var app = express();

var redis = require("redis");
var client = redis.createClient(process.env.REDIS_PORT, process.env.REDIS_HOST);

app.get('/:slug', function(req, res) {
    client.get(req.params.slug, function(err, reply) {
        if (reply)
            res.redirect(reply);
        else
            res.send('not found');
    });
});

app.listen(3000, '0.0.0.0');
console.log('Listening on port 3000');
