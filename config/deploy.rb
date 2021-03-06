lock '3.6.1'

set :application, 'bangarang-bend'
set :repo_url, 'git@github.com:adamrunner/bangarang-bend.git'

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value


# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_dirs, %w{public/images/uploads tmp/pids}
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web) do
      execute "cd #{release_path} && RAILS_ENV=#{fetch(:rails_env)} #{fetch(:rbenv_prefix)} bundle exec rails runner -e #{fetch(:rails_env)} \"Rails.cache.clear\"", raise_on_non_zero_exit: false
    end
  end

end
