require 'blockenspiel'
require 'railsyard-backend/dsl/base'

module Railsyard::Backend
  module Dsl

    class EditField < Base
      delegate_to_config :visible,       :visible=
      delegate_to_config :input_options, :input_options=
    end

  end
end
