# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


set :application, "urm"
set :repository,  "http://canberra/git/urm"
set :deploy_to,  "/Railsapp/#{application}"

# variables for pathes on canberra server:
# current_path = /RailsServer/urm/current
# shared_path  = /RailsServer/urm/shared

# mysql database settings on canberra server:
set :dbname,  "urm"
set :dbuser,  "user_urm"
set :dbpass,  "pwd_urm"

set :scm, :git

# for canberra:
role :web, "itmadmin@canberra"                   # Your HTTP server, Apache/etc
role :app, "itmadmin@canberra"                   # This may be the same as your `Web` server
role :db,  "itmadmin@canberra", :primary => true # This is where Rails migrations

#role :db,  "your slave db-server here"

set :rails_env, :production

# itmadmin should be enough (no sudo wanted!)
set :use_sudo, false

# For Passenger mod_rails we overwrite start/stop/restart:
namespace :deploy do
   desc "URM: start server after deploying the project"  
   task :start do ; end
   
   desc "URM: stop server before deploying the project"
   task :stop do ; end
   
   desc "URM: restart the server the project"
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

   # (pre-)compile the assets after deploying the project:
   desc "URM: (pre-)compile the assets (after deploying) the project"
   task :pipeline_precompile do
       #run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
       run "pwd; echo $PATH"
       run "cd #{current_path}; RAILS_ENV=production bundle exec rake assets:precompile"
   end
end

desc "URM: (re-)create the 'ruby'-dir link within the current app" 
task :setuprubylink, :roles => [:app, :db, :web] do
     run "rm -Rf #{current_path}/ruby"
     run "ln -s  #{shared_path}/ruby #{current_path}/ruby"
end

desc "URM: (re-)create the 'vendor'-dir link within the current app" 
task :setupvendorlink, :roles => [:app, :db, :web] do
     run "rm -Rf #{current_path}/vendor"
     run "ln -s  #{shared_path}/vendor #{current_path}/vendor"
end

after "deploy", :setuprubylink, :setupvendorlink


# some optional tasks with the database:
# (e.g. for making some plain text backups)
# (do not forget to save the uploaded images/pdfs/binaries from system/attachment also)
namespace :sql do

  desc "URM: show sql-db-stats"
  task :status do
    # canberra
     run "mysql --user=#{dbuser} --password=#{dbpass} #{dbname} -e 'status' "
  end 

  desc "URM: show sql-db last migration number"
  task :showlastmigration do
    run "mysql --user=#{dbuser} --password=#{dbpass} #{dbname} -e 'select * from schema_migrations order by version desc limit 1' "
  end

  desc "URM: dump sql-structure/data to 'shared/dump_YY-MM-DD.sql' "
  task :dump do
    run "ls -al #{current_path}"
    set :ts, Time.new.strftime("%Y-%m-%d")
    run "mysqldump --user=#{dbuser} --password=#{dbpass} #{dbname} > #{shared_path}/dump_#{ts}.sql "
  end 

  desc "URM: copy shared/dump_YY-MM-DD.sql of today from server to tmp"
  task :download_dump do
    set :ts, Time.new.strftime("%Y-%m-%d")
    download "#{shared_path}/dump_#{ts}.sql","/tmp", :via => :scp
  end 

end

# see also: http://wiki.brightbox.co.uk/docs:gemv2:capistrano