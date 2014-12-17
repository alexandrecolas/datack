module Datack
  module Tasks

    def self.import
      root_path = Datack.configuration.dir_path
      root_path.pop if root_path[-1] == "/"

      Dir["#{root_path}/*.yml"].each do |file|
        datas = YAML::load(File.open(file))
        klass = datas[:model].camelize.constantize

        progress = Datack::ProgressBar.initialize(datas[:records].size)

        progress.log("importing '#{datas[:model]}' records")

        datas[:records].each do |record|
          klass.create(record) unless klass.exists?(record)
          progress.increment
        end
      end
    end


    def self.export(model: nil)
      root_path = Datack.configuration.dir_path
      root_path.pop if root_path[-1] == "/"

      begin
        klass = model.camelize.constantize

        courts = klass.all.map(&:attributes).each do |court|
          court.delete_if { |k| %w(id created_at updated_at).include? k }
        end

        yaml = { model: model, records: courts }.to_yaml

        name = "#{model}-#{Time.now.strftime('%d-%m-%Y')}.yml"
        File.open("#{root_path}/#{name}", "w+") { |file| file.write(yaml) }
      rescue
        puts "#{model} doesn't exists"
      end

    end

  end
end
