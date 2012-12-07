# -*- encoding : utf-8 -*-
require "bundler/capistrano"

load 'deploy/assets'


set :application, "ostanovim-konets-sveta.ru"
set :repository,  "git@github.com:moxorama/ostanovim-konets-sveta.ru.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, :mossy
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"

role :web, "ostanovim-konets-sveta.ru"                          # Your HTTP server, Apache/etc
role :app, "ostanovim-konets-sveta.ru"                          # This may be the same as your `Web` server
role :db,  "ostanovim-konets-sveta.ru", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
