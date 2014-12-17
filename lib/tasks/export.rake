namespace :datack do
  desc "Export files"
  task :export, [:model] => :environment do |t, args|
    Datack::Tasks.export(model: args[:model])
  end
end
