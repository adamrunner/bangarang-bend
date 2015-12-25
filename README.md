#Bangarang Bend
A Rails Website for the Bangarang Bend catering company
##Colors
Red - `#C34C3B`
Blue - `#445768`

##Vendors
Hostname/Registration - namecheap.com
SSL - sslmate.com
Hosting - TBD digitalocean or amazon web services

##Libraries Used
Rails 4, Backbone, VelocityJS, Bootstrap 4 w/Flexbox, Devise, CarrierWave
## Todo List/Backlog
The application backlog is maintained in Trello
https://trello.com/b/6LseRF5z/bangarang-bend-website

## Dependencies

1. MySQL `apt-get install mysql-server`
1. MySQL Socket File: `/tmp/mysql.sock`
1. libmagic - `apt-get install libmagic-dev` or `brew install libmagic`

## Development

1. Clone the application
1. Verify you have installed the dependencies
1. Install the gems `bundle install`
1. Create the DB: `rake db:create`
1. Fire up the server `rails s`
1. Visit http://localhost:3000
1. Run `guard` to run tests as you develop `bundle exec guard`

## Branching

1. Fork from `master`
1. Name your branch as so: `feature/my-awesome-feature`
1. Work on your branch, commit, etc.
1. Write specs/tests for your new functionality
1. Verify all specs pass (and you didn't break old functionality) `bundle exec rspec`
1. Push your feature branch `git push origin -u feature/my-awesome-feature`
1. Create a pull request for your feature

## Deployment

To deploy the master branch to production: `cap production deploy`

TODO: Finish documentation here
To deploy your changes to
1. Set your branch in `/config/deploy/preview.rb`
1. Run a deploy against the staging environment. `cap preview deploy`
