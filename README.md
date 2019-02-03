#
# Prerequsites:

**Verify that you have a current version of Ruby *(v2.3.1 or later)*:**
``` 
ruby -v
```

**To install Rails, use the gem install command provided by RubyGems:**
```
gem install rails
```

**To verify that you have everything installed correctly, you should be able to run the following:**
```
rails --version
```

#
# Let's Start On Our Rails App
**Navigate to the folder that you want to start your Rails App on:**
```
cd <file path>    (eg. cd ~/Workspace)
```

**To make the skeleton of your Rails App:**
```
rails new <App name>    (eg. rails new todo)
```

**"cd" into the project folder:**
```
cd todo
```

**Now run the Rails Server:**
```
rails server    [OR rails s] [You can check out your site on "localhost:3000/"]
```
*Ensure that you have "killed" the server by pressing "Ctrl + c"*

**Create a Repository on GitHub for this project:**
```
echo "# todo" >> README.md (optional)
git init
git add .
git commit -m "First commit"
git remote add origin https://github.com/<username>/<repo name>.git
[OR if ssh enabled]
git remote add origin git@github.com:<username>/<repo name>.git
[To check where your repo is pointing to: git remote -v]
git push -u origin master
```

#
# Say Hello Rails
**Create a "*controller*":**
*A **controller's** purpose is to receive specific requests for the application. A **view's** purpose is to display this information in a human readable format. An important distinction to make is that it is the controller, not the view, where information is collected. The view should just display that information.*
```
rails generate controller Welcome index

[This will genetrate a CONTROLLER file: app/controllers/welcome_controller.rb && VIEW file: app/views/welcome/index.html.erb]
```

**Open the app/views/welcome/index.html.erb file in your text editor. Delete all of the existing code in the file, and replace it with the following single line of code:**
```
<h1>Hello, Rails!</h1>
```

#
# Setting The Application Home Page
**To "tell" Rails where your home page is located. Open the file config/routes.rb in your editor & update it to:**
```
Rails.application.routes.draw do
  get 'welcome/index'
 
  root 'welcome#index'
end
```

#
# Getting Up & Running
**Create a new "*resource*":**
*A resource is the term used for a collection of similar objects, such as articles, people or animals. You can create, read, update and destroy items for a resource and these operations are referred to as CRUD operations.*

*Rails provides a resources method which can be used to declare a standard REST resource. You need to add the article resource to the config/routes.rb so the file will look as follows:*
```
Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :articles
 
  root 'welcome#index'
end
```

*If you run **rails routes**, you'll see that it has defined routes for all the standard RESTful actions. The meaning of the prefix column (and other columns) will be seen later, but for now notice that Rails has inferred the singular form article and makes meaningful use of the distinction.*

#


#
Based on: https://guides.rubyonrails.org/getting_started.html