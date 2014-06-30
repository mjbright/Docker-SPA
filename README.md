SPA
===

This repository is for the creation of a Docker container image for developing and testing Single Web Page Applications, or SPAs.

It's contents are inspired by the exercises described in the book Single Page Web Applications by Michael Mikowski,
published by Manning Books.
    http://www.manning.com/mikowski/
    
The repository starts from a Ubuntu 14.04 base and adds:
    - Node.js / npm and several modules (Express/http-server/nodeunit/mongodb/socket.io/connect...)
    - Java - needed for JSLint

It create a user 'user' and starts the ssh daemon.

