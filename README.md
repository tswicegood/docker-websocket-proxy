# docker-websocket-proxy
Simple container that implements a very basic WebSocket proxy.

It's built as an example of using nginx in front of [bokeh][] so many of the
defaults are based around that.

## Usage
You must provide `WEB_URL` as an environment variable when running this
container.  It sets the location to proxy to.  For example, if you want to
proxy to `192.168.1.100` on port `5006`, you should run this container like
this:

    docker run --name=bokeh --rm -P \
      -e WEB_URL=192.168.1.100:5006 \
      tswicegood/websocket-proxy

You can also specify the `WEBSOCKET_URL` (only required if different than the
`WEB_URL`), as well as the `WEBSOCKET_LOCATION`.  The latter is used when you
need to specify a particular PATH that is used for WebSocket communication.
This value defaults to `/bokeh/sub`.

This container exposes ports `80` and `443` by default, so using `-P` or
`--publish-all` auto-assigns those ports.


## Using Outside of Docker
You can use this as an example to build your own configuration as there is
little inside the `nginx.conf` file other than the basic configuration.  To
let Docker generate your configuration: run this container as shown above then
run:

    docker exec bokeh cat /etc/nginx/nginx.conf

Adjust the name `bokeh` to match whatever you called your container.  You can
pipe that output to a file or simply copy-n-paste the output.  Adjust as needed.


[bokeh]: http://bokeh.pydata.org/
