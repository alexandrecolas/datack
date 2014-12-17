require 'rails/railtie'
require 'ruby-progressbar'

require "datack/version"
require "datack/configuration"
require "datack/progress_bar"
require "datack/tasks"


module Datack

  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../tasks/import.rake', __FILE__)
      load File.expand_path('../tasks/export.rake', __FILE__)
    end
  end

end
