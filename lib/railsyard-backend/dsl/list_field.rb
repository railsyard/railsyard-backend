require 'blockenspiel'
require 'railsyard-backend/dsl/base'

module Railsyard::Backend
  module Dsl

    class ListField < Base
      delegate_value_or_block :format_as, to: :formatter=
    end

  end
end
