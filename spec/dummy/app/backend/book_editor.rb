# Railsyard.backend.define_editor_for Book do

  # label_method :title

  # list do
  #   hierarchically by: :parent

  #   field :title do
  #     format_as { |value| value.to_s.upcase }
  #   end

  #   field :author do
  #     use_partial { |value| "author" }
  #   end

  #   field :updated_at do
  #     strftime_format "%Y-%m-%d"
  #   end

  #   field :created_at do
  #     date_format :short
  #     visible if: lambda { |value| current_user.admin? }
  #   end

  # end

  # edit do
  #   group :main do
  #     field :title, as: :string
  #     field :author do
  #       use_partial { |value| "author" }
  #     end
  #     field :updated_at do
  #       read_only unless: lambda { |value| current_user.admin? }
  #     end
  #     field :created_at do
  #       visible true
  #     end
  #   end
  # end

# end
