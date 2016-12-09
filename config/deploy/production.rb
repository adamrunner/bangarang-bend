require "delayed/recipes"

set :rails_env, "production" #added for delayed job
set :stage, :production
set :branch, 'master'
server 'bangarangbend.com', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/home/deploy/bangarang-bend'

after "deploy:finished", "delayed_job:restart"

# If you want to use command line options, for example to start multiple workers,
# define a Capistrano variable delayed_job_args:
#
#   set :delayed_job_args, "-n 2"
