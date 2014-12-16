module Datack
  module ProgressBar

    def self.initialize(total)
      @progress_bar ||= ::ProgressBar.create(
        format: '%a %E %b=>%i %p%% %t',
        progress_mark: '=',
        remainder_mark:'･',
        starting_at: 0,
        total: total)
    end

  end
end
