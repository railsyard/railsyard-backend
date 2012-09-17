require 'blockenspiel'
require 'railsyard/dsl/base'

module Railsyard
  module Dsl

    class EditField < Base
      delegate_value_or_block :visible,       to: :visible=
      delegate_value_or_block :input_options, to: :input_options=
    end

  end
end
