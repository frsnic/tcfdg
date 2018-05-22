# config valid only for current version of Capistrano
lock '3.10.2'

set :application, 'tcfdg'
set :repo_url, 'git@github.com:frsnic/tcfdg.git'
set :rvm_ruby_version, '2.3.1@tcfdg'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w(config/app_config.yml config/database.yml config/secrets.yml config/initializers/ckeditor_dragonfly.rb config/initializers/rollbar.rb)

# Default value for linked_dirs is []
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets public/system public/files)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 10

set :passenger_restart_with_touch, true

# resque
set :resque_rails_env, fetch(:rails_env)
set :workers, { 'mail_worker' => 1 }

after "deploy:restart", "resque:restart"
