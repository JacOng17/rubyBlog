# Ruby Blog

## Prerequsites

**Verify that you have a current version of Ruby *(v2.3.1 or later)*:**

    ruby -v

** You will also need an installation of the SQLite3 database. To check if it's installed:**

    sqlite3 --version

**To install Rails, use the gem install command provided by RubyGems:**

    gem install rails

**To verify that you have everything installed correctly, you should be able to run the following:**

    rails --version

## Let's Start On Our Rails App

**Navigate to the folder that you want to start your Rails App on:**

    cd <file path>    (eg. cd ~/Workspace)

**To make the skeleton of your Rails App:**

    rails new <App name>    (eg. rails new blog)

**"cd" into the project folder:**

    cd blog

**The blog directory has a number of auto-generated files and folders that make up the structure of a Rails application. Most of the work in this tutorial will happen in the app folder, but here's a basic rundown on the function of each of the files and folders that Rails created by default:**

| File/Folder   | Purpose|
|---------------|--------|
| app/          | Contains the controllers, models, views, helpers, mailers, channels, jobs and assets for your application. You'll focus on this folder for the remainder of this guide.|
| bin/          | Contains the rails script that starts your app and can contain other scripts you use to setup, update, deploy or run your application.|
| config/       | Configure your application's routes, database, and more. Refer to https://guides.rubyonrails.org/configuring.html|
| config.ru     | Rack configuration for Rack based servers used to start the application. Refer to https://rack.github.io/|
| db/           | Contains your current database schema, as well as the database migrations.|
| Gemfile       | A Gemfile describes the gem dependencies required to execute associated Ruby code. Refer to https://bundler.io/man/gemfile.5.html|
| Gemfile.lock  | These files allow you to specify what gem dependencies are needed for your Rails application. These files are used by the Bundler gem. Refer to https://bundler.io/|
| lib/          | Extended modules for your application.|
| log/          | Application log files.|
| package.json  | This file allows you to specify what npm dependencies are needed for your Rails application. This file is used by Yarn. Refer to https://yarnpkg.com/lang/en/|
| public/       | The only folder seen by the world as-is. Contains static files and compiled assets.|
| Rakefile      | This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the lib/tasks directory of your application.|
| README.md     | This is a brief instruction manual for your application. You should edit this file to tell others what your application does, how to set it up, and so on.|
| test/         | Unit tests, fixtures, and other test apparatus. Refer to https://guides.rubyonrails.org/testing.html|
| tmp/          | Temporary files (like cache and pid files).|
| vendor/       | A place for all third-party code. In a typical Rails application this includes vendored gems.|
| .gitignore    | This file tells git which files (or patterns) it should ignore. Refer to https://help.github.com/articles/ignoring-files/|
| .ruby-version | This file contains the default Ruby version.|

**Now run the Rails Server:**

    rails server    [OR rails s] [You can check out your site on "localhost:3000/"]

*Ensure that you have "killed" the server by pressing "Ctrl + c"*

**Create a Repository on GitHub for this project:**

    echo "# blog" >> README.md (optional)
    git init
    git add .
    git commit -m "First commit"
    git remote add origin https://github.com/<username>/<repo name>.git
    [OR if ssh enabled]
    git remote add origin git@github.com:<username>/<repo name>.git
    [To check where your repo is pointing to: git remote -v]
    git push -u origin master

## Say Hello Rails

**Create a "*controller*":**
*A **controller's** purpose is to receive specific requests for the application. A **view's** purpose is to display this information in a human readable format. An important distinction to make is that it is the controller, not the view, where information is collected. The view should just display that information.*

    rails generate controller Welcome index

[This will genetrate a CONTROLLER file: app/controllers/welcome_controller.rb && VIEW file: app/views/welcome/index.html.erb]

**Open the app/views/welcome/index.html.erb file in your text editor. Delete all of the existing code in the file, and replace it with the following single line of code:**

    <h1>Hello, Rails!</h1>

## Setting The Application Home Page

**To "tell" Rails where your home page is located. Open the file config/routes.rb in your editor & update it to:**

    Rails.application.routes.draw do
      get 'welcome/index'

      root 'welcome#index'
    end

## Getting Up & Running

**Create a new "*resource*":**
*A resource is the term used for a collection of similar objects, such as articles, people or animals. You can create, read, update and destroy items for a resource and these operations are referred to as CRUD operations.*

*Rails provides a resources method which can be used to declare a standard REST resource. You need to add the article resource to the config/routes.rb so the file will look as follows:*

    Rails.application.routes.draw do
      get 'welcome/index'

      resources :articles

      root 'welcome#index'
    end

*If you run **rails routes**, you'll see that it has defined routes for all the standard RESTful actions. The meaning of the prefix column (and other columns) will be seen later, but for now notice that Rails has inferred the singular form article and makes meaningful use of the distinction.*

Based on: https://guides.rubyonrails.org/getting_started.html