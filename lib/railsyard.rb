require "railsyard/engine"

module Railsyard
  class << self
    def backend
      require "railsyard/backend"
      @@backend ||= Backend::Base.new
    end
  end
end
