#!/usr/bin/python3

import zmq

context = zmq.Context()

#  Socket to talk to server
print("Connecting to hello world server…")
socket = context.socket(zmq.REQ)
# socket.connect("tcp://localhost:5555")
socket.connect("ipc:///tmp/concentratord_command")

#  Do 10 requests, waiting each time for a response
for request in range(10):
    print("Sending request %s …" % request)
    # socket.send(b"Hello")
    socket.send(b"gateway_id")

    #  Get the reply.
    message = socket.recv()
    print("Received reply %s [ %s ]" % (request, message))
