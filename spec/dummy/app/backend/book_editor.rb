Railsyard.backend.define_editor_for Book do

  label :title

  list do
    sortable using: :foo
    field :subtitle
    field :description_excerpt
  end

  edit do
    field :title
    field :subtitle
    field :description
  end

end
