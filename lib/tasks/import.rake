namespace :datack do
  desc "Import files"
  task :import => :environment do
    Datack::Tasks.import
  end
end
