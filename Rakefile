namespace :db do
  require 'config/database'

  desc "Migrate the database (deletes data)"
  task :migrate do
    DataMapper.auto_migrate!
  end

  desc "Upgrade the database schema (data safe)"
  task :upgrade do
    DataMapper.auto_upgrade!
  end

  desc "Add some test data"
  task :generate do
  end

  desc "Clear test data"
  task :clean do
  end
end

