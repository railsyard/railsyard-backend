require 'railsyard-backend/support/dsl'

module Railsyard::Backend
  module Export

    class ConfigDsl < Support::Dsl
      delegate_value_or_block :content_type, to: :content_type=
      delegate_value_or_block :use, to: :exporter=
    end

  end
end
