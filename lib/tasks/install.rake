namespace :install do
  desc "installs the application"
  task :debian_squeeze => :environment do
    if !File.exists? "#{Rails.root}/db/production.sqlite3"
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
    directory "app/assets/stylesheets"
    end
  end
end