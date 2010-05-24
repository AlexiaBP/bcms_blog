# Blog Module for BrowserCMS

A simple blog module that lets users create multiple blogs. 

## Features

* Users can easily create one or more blogs with their corresponding sections, pages and routes.
* Leverages BrowserCMS' built-in categorization and tagging and authorization framework.
* Comments are just ContentBlocks so they are versioned and moderated out of the box.
* Blog blocks can be added to any container in any page.

## Installation

    gem install bcms_blog
    
## Set up your application to use the module

### 1. Edit config/environment.rb 
    
    config.gem "browsercms"
    config.gem "bcms_blog"
    
### 2. Run the following commands
  
    script/generate browser_cms
    rake db:migrate
  
### 3. Edit config/routes.rb
  
    routes_for_bcms_blog
    routes_for_browser_cms


## Creating a Blog

When you create a Blog content block from the content library, all the structure needed for the blog to run
is created for you. This includes a new section, 2 pages, a few page routes and a portlet.


## Customization

The module provides a template that is a good starting point for your blog's layout. If you want
to further customize the look and feel, just copy the file app/views/partials/\_blog_post.html.erb
on this repository to app/views/partials on your application and modify it to suit your needs.

Keep in mind that both the posts list and individual post pages are handled by the same partial.

## Contributors

* Tyler Rick
* Jon Leighton

