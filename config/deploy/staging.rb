set :stage, :staging
set :branch, 'staging'
server 'bangarangbend.com', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/home/deploy/bangarang-bend-staging'
set :rails_env, 'staging'


# If you want to use command line options, for example to start multiple workers,
# define a Capistrano variable delayed_job_args:
#
#   set :delayed_job_args, "-n 2"
