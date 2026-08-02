# BiteMe

BiteMe is a Java desktop app for a food-ordering business with several branches. I built it for a university course to learn how a client and a server talk to each other over a network using OCSF (the Object Client-Server Framework).

## Demo Video

[![Project Demonstration](https://img.youtube.com/vi/ZpqmEIUyOag/maxresdefault.jpg)](https://www.youtube.com/watch?v=ZpqmEIUyOag)

## What the project is about

The main goal of this project was to understand client-server communication with OCSF. OCSF is a small framework that takes care of the network sockets for you, so you can focus on the messages the client and server send to each other.

There are two sides:

- The client is a JavaFX app that the user sees and clicks on.
- The server runs in the background, talks to a MySQL database, and answers the client.

They connect over TCP on port 5555.

## How the connection works

Each message is a list. The first item is a command (like "Get Login Validation"), and the items after it are the data the server needs. The server reads the first item to know what to do, runs the matching code, and sends an answer back to the same client.

A login, for example, works like this:

1. The user types a username and password and clicks Log in.
2. The client builds the list ["Get Login Validation", username, password] and sends it to the server.
3. The server checks the details in the database and sends the result back.
4. The client reads the result and either opens the home page or shows an error.

Every other feature (menus, orders, reports) uses the same idea: send a command with some data, let the server handle it and reply.

Some of the commands the server understands:

- Get Login Validation - check the username and password
- Get User Info - get the logged-in user's details
- Get Restaurants Info - get the list of restaurants
- Get Restaurant Menu Info - get a restaurant's menu
- Get Item's Additions Info - get the add-ons for an item
- Get OrdersReport Info - get the data for a report

## Project structure

- OCSF - the framework that handles the network connection (not written by me, I build on it)
- BiteMe-Common - the shared classes used by both sides (User, Restaurant, Menu, Item, Order, and so on)
- BiteMe-Client - the JavaFX app: ChatClient plus the screens and their controllers
- BiteMe-Server - EchoServer (handles the messages) and DataBaseControl (runs the database queries)

The app has five types of users: Customer, Restaurant, Certified Worker, Branch Manager, and CEO. Each one sees a different home screen after logging in.

## Tools used

- Java 8 and JavaFX for the app
- OCSF for the client-server messaging
- MySQL for storing the data

## How to run

1. Start MySQL and load the database tables. Keep one user account to log in with.
2. Run Server.ServerUI, enter the database details in the server window, and click Start Server.
3. Run client.ClientUI, enter the server IP (use localhost if it is the same computer), and log in.

The server has to be running before the client can connect.

## Credits

The client-server communication is built on OCSF (Object Client-Server Framework) by Robert Laganiere and Timothy C. Lethbridge. I made this as a project for my BSc course.
