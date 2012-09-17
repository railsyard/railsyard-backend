require 'railsyard/support/dsl'

module Railsyard
  module Export

    class ConfigDsl < Support::Dsl
      delegate_value_or_block :content_type, to: :content_type=
      delegate_value_or_block :use, to: :exporter=
    end

  end
end
