set :application, "basecamp"
set :deploy_to, "/home/pagalguy/public_html/.#{application}"
set :user, "deploy"

set :scm, :git
set :repository, "git://github.com/ganga/Basecamp.git"
set :scm_username, "ganga.reddy@pagalguy.com"
set :branch, "master"
set :use_sudo, false
set :repository_cache, "git_cache"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true


#role :app, "lb1"
#role :app, "db2"
role :app, "plutonium"

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "rm -f /home/pagalguy/public_html/#{application}"
    run "ln -s #{current_path} /home/pagalguy/public_html/#{application}"
  end

  [:start, :stop].each do |t|
  desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end


