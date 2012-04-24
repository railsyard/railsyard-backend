require 'blockenspiel'
require 'railsyard-backend/dsl/base'

module Railsyard::Backend
  module Dsl

    class ListField < Base
      delegate_to_config :format_as,   :format=
      delegate_to_config :use_partial, :partial=
      delegate_to_config :date_format, :date_format=
      delegate_to_config :visible,     :visible=
    end

  end
end
