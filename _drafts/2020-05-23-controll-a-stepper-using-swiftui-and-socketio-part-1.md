---
title: Control a stepper motor with SwiftUI and Python via Socket.IO  - Part 1
layout: post
categories: SwiftUI

---
This is Blog Post ist part of a 3 Post series explaining how to control a stepper motor with a SwiftUI app, a Server running Python, and Socket.IO to communicate via Client and Server.

You can find the other posts here:

* [Part 1: Building the SwiftUI App]()
* [Part 2: Controlling a Stepper with Python]()
* [Part 2: Putting it all together]()

***

# Part 1: Building the SwiftUI App

This post will explain how to build the front-end using SwiftUI. We will communicate to the Server using Socket.IO

Socket.IO enables real-time bidirectional event-based communication. This means we can send and receive data from the server that controls the Stepper Motor in real-time. To use Socket.IO we need to install the  [Socket.IO-Client-Swift
](https://github.com/socketio/socket.io-client-swift)
You can install the Libary using Swift Package Manager.

## Building the Main Interface

***

* Next: [Part 2: Controlling a Stepper with Python]()