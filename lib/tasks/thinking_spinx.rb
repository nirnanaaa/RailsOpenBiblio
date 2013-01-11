namespace :deploy do
 
  desc "Config Search"
  task :search_config, :roles => :app do
    run "cd #{current_path} && rake ts:config RAILS_ENV=production"
  end
 
  desc "Start Search"
  task :search_start, :roles => :app do
    run "cd #{current_path} && rake ts:start RAILS_ENV=production"
  end
 
  desc "Stop Search"
  task :search_stop, :roles => :app do
    run "cd #{current_path} && rake ts:stop RAILS_ENV=production"
  end
 
  desc "Rebuild Search"
  task :search_rebuild, :roles => :app do
    run "cd #{current_path} && rake ts:stop RAILS_ENV=production"
    run "cd #{current_path} && rake ts:config RAILS_ENV=production"
    run "cd #{current_path} && rake ts:index RAILS_ENV=production"
    run "cd #{current_path} && rake ts:start RAILS_ENV=production"
  end
 
  desc "Index Search"
  task :search_index, :roles => :app do
    run "cd #{current_path} && rake ts:in RAILS_ENV=production"
  end
   
  desc "Re-establish symlinks"
  task :copy_sphinx do
    run <<-CMD
      rm -rf #{current_path}/db/sphinx &&
      ln -nfs #{shared_path}/db/sphinx #{current_path}/db/sphinx
    CMD
  end
end
