set :stage, :production
set :branch, 'master'
server 'bangarangbend.com', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/home/deploy/bangarang-bend'
