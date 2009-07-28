set :application, "basecamp"
set :deploy_to, "/home/inzanecenter/public_html/#{application}"
#set :user, "pagalguy"
#set :password, "pagalguyhq"
set :scm, :git
set :repository, "git://github.com/ganga/Basecamp.git"
set :scm_username, "ganga"
set :scm_passphrase, ""
set :branch, "master"
set :use_sudo, false
set :repository_cache, "git_cache"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true


# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

#role :app, "206.251.76.234"
role :app, "plutonium"
#role :web, "your web-server here"
#role :db,  "192.168.1.72", :primary => true
namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
   run "touch #{current_path}/tmp/restart.txt"
   run "cp #{current_path}/config/database.yml.production #{current_path}/config/database.yml"
   run "ln -s #{current_path}/public /home/pagalguy/public_html/studio/beta/#{application}"
   run "mkdir -p #{deploy_to}/shared/log"
   run "touch #{deploy_to}/shared/log/production.log"
   run "chmod -R 777 #{deploy_to}/"
   run "cd #{current_path} && rake gems:install"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

