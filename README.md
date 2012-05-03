# Knead

A Gem used to provide basic bug logging capability to a Rails app. All bugs are stored in Redis. This Gem only handles the capture of the bug information. Display and modification of the data happens elsewhere.

A client to read the bugs is coming soon..

## Setup

This assumes you have a working Rails 3.2.3+ app, are using the asset pipeline, and have set up Redis within your app.

#### 1. Add the gem to your Gemfile:

    gem 'knead', :git => 'git@github.com:ovenbits-ingredients/knead.git'

#### 2. Include the knead assets in your application.css and application.js files:

    /* application.css */
    /* = require knead */

    // application.js
    //= require knead

#### 3. Make sure Redis is set up and conneted.

You can test this out by checking `Redis.current` in the console.

#### 4. Restart app

Restart the web server and you should be good to go.

## Default User Name

If you want to log the current user from within your app, include the helper `knead_user` in your layout:

   <%= knead_user %>

This will generate a JSON representation of the current user's name and id. (Assumes there is an object named `current_user` that responds to `:id` and `:name`. If not present, this is ignored.

## License

Knead is released under the [MIT license](http://www.opensource.org/licenses/MIT)