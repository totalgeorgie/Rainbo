# ProFlows 0.1 - formerly Rainbo

Agile software development project tracker with integrated WebRTC conference calling. Currently in beta.

ProFlows helps your team flow to a completed software project.
Create, categorize and assign tasks with a desktop-quality UI.
Stay in sync with in-browser conference calling.

# THE TECH STACK

A Rails app running on Heroku connected to a PostgreSQL opening up WebSockets to communicate with the OpenTok API and using HTML5 getUserMedia API to access the client's webcam and set up the conference calling.

jQuery UI/Backbone.js used on the front end to build out a nicely-animated, structured front-end JS MVC app that processes JSON data coming from the Rails app.

# UPCOMING

Currently looking to factor out the OpenTok API and host my own STUN/TURN (Session Traversal Utilities for NAT/Transversal Using Relays around NAT) to faciliate p2p VoIP. Will implement this with Node.

Also looking to store shared session data into a Redis instance that both the Rails and Node application can refer to.

Development site hosted at http://proflo.ws/
