require 'blockenspiel'
require 'railsyard/dsl/base'

module Railsyard
  module Dsl

    class ListField < Base
      delegate_value_or_block :format_as, to: :formatter=
    end

  end
end
