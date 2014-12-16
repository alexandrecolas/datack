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

  end
end
