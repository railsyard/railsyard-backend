require 'blockenspiel'
require 'railsyard/backend/dsl/base'

module Railsyard
  module Backend
    module Dsl

      class EditField < Base
        delegate_to_config :read_only,   :read_only=
        delegate_to_config :use_partial, :partial=
        delegate_to_config :visible,     :visible=
      end

    end
  end
end
