require 'blockenspiel'
require 'railsyard/backend/dsl/base'

module Railsyard
  module Backend
    module Dsl

      class EditField < Base
        delegate_to_config :readonly,      :readonly=
        delegate_to_config :use_partial,   :partial=
        delegate_to_config :visible,       :visible=
        delegate_to_config :input_options, :input_options=
      end

    end
  end
end
