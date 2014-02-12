angular-mojo-todo
=========

Source Code - SLC PerlMongers AngularJS + Mojolicious::Lite Todo Application

Technology
----------
- Git (Github)
    - Source control system
    - .gitignore allows you to specify what is contained within repository
- NPM (Node Packaged Modules)
    - Official package manager for Node.js
    - For this app, used to install Bower module
    - Uses package.json
- Bower
    - A package manager for the Web
    - Specifically handles front-end dependencies
    - For this app, used to install bootstrap and angular
    - Uses bower.json and .bowerrc
- Mojolicious
    - Backend Perl MVC framework
    - Provides Mojolicious::Lite, which is an out-of-the-box RESTful framework
    - For this app, we use a single module called MojoAngular.pm, which defines our model, routes and controllers
- Node.js
    - Used to build server-side applications in JavaScript
    - Has a built-in Web server library allowing applications to run independent of other traditional Web servers
    - For this app, we use it to run a simple Web server to handle our AngularJS application, the file is called server.js
- Bootstrap
    - A front-end framework for developing responsive, mobile first projects on the web
    - Many, many pre-built templates and themes exist
    - For this app, we use it to abstract boilerplate CSS and HTML code
- AngularJS
    - A front-end MVC framework that allows us to dynamically interact with our view without directly modifying the DOM
    - Much of the logic is handled in the app.js and controllers.js files and is included as a dependency in our index.html file
    - Provides two-way data binding, directives, dependency injection, filters, RESTful communication services and much more
    
Project Setup / Branch
----------------------
Once the frontend server is running, you can access the Web site at http://localhost:8000

```sh
git clone https://github.com/rooeydaniel/angular-mojo-todo.git
cd /path/to/angular-mojo-todo
```

Branch v1
Shows use of package.json (NPM)
```sh
git checkout v1
npm install # This will create a node_modules folder which will include bower
```

Branch v2  
Shows use of bower.json, .bowerrc (Bower)
```sh
git checkout v2
cd frontend
npm install
cd .. # Go back to parent directory
```

Branch v3  
Shows a simple Web page being served up by Node.js
```sh
git checkout v3
cd frontend
npm install
node server/server.js # Will start up the frontend on port 8000, ctrl+c exits
cd ..
```

Branch v4  
Shows bootstrap integration, angular integration and a simple angular expression
```sh
git checkout v4
cd frontend
npm install # This will now load the bower packages, angular and bootstrap
node server/server.js
cd ..
```

Branch v5  
Shows how to display a list of items with Angular, uses a JSON file for its data
```sh
git checkout v5
cd frontend
npm install
node server/server.js
cd ..
```

Branch v6  
Shows the integration of Mojolicious::Lite, it simply passes back stubbed in data
```sh
git checkout v6
cd frontend
npm install
node server/server.js
cd ../backend
morbo lib/MojoAngular.pm
cd ..
```

Branch v7  
Shows implementation of todo creation
```sh
git checkout v7
cd frontend
npm install
node server/server.js
cd ../backend
morbo lib/MojoAngular.pm
cd ..
```

Branch v8   
Shows implementation of todo status update
```sh
git checkout v8
cd frontend
npm install
node server/server.js
cd ../backend
morbo lib/MojoAngular.pm
cd ..
```

Branch v9  
Shows implementation of todo deletion
```sh
git checkout v9
cd frontend
npm install
node server/server.js
cd ../backend
morbo lib/MojoAngular.pm
cd ..
```

Directory Layout
----------------
    .gitignore                  --> Artifacts we do not want in our git repositories, switched based on where we are pushing changes
    README.md                   --> This file

    backend/
        lib/
            MojoAngular.pm      --> Handles the back-end RESTful routes that create, retrieve, update and delete various todos
    frontend/
        public/
            css/
                app.css         --> Couple of custom styles for the view
            js/
                app.js          --> Sets up the AngularJS module and includes controllers as a dependency
                controllers.js  --> Handles user interaction, model setup
            json/
                todos.json      --> Used in early branches for stubbed in data
            index.html          --> Angular and Bootstrap dependencies are included, the main view for our application
        server/
            server.js           --> Simple Node.js Web server
       .bowerrc                 --> Configures bower to install components under public/lib
        .gitignore              --> Artifacts we do not want in our git repositories, switched based on where we are pushing changes
        bower.json              --> Declares front-end dependencies, like angular and bootstrap
        package.json            --> Declares dev and prod dependencies, for prod it will install bower 