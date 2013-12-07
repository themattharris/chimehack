namespace :db do
  desc "Drop and recreate local db"
  task :rebuild => :environment do
    system("env RAILS_ENV=development rake db:drop db:create db:migrate db:seed")
  end

  desc "Reseed db data"
  task :reseed => :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table};")
      ActiveRecord::Base.connection.execute("DROP TABLE #{table};")
    end
    system("env RAILS_ENV=development rake db:migrate db:seed")
  end
end