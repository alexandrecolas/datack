module Datack
  class Configuration
    attr_accessor :dir_path, :debug

    def initialize
      @dir_path ||= "#{Rails.root}/db/datas"
      @debug ||= false
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end

end
