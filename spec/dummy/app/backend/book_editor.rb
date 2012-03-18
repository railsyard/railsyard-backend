Railsyard.backend.define_editor_for Book do

  label :title

  list do
    field :title
    field :subtitle
    field :description
  end

  edit do
    field :title
    field :subtitle
    field :description
  end

end
