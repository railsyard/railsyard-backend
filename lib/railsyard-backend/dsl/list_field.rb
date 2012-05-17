require 'blockenspiel'
require 'railsyard-backend/dsl/base'

module Railsyard::Backend
  module Dsl

    class ListField < Base
      delegate_to_config :format_as, :format=
    end

  end
end
