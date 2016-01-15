set :stage, :staging
set :branch, 'staging'
server 'bangarangbend.com', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/home/deploy/bangarang-bend-staging'
set :rails_env, 'staging'
