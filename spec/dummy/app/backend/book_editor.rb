Railsyard::Backend.define_editor_for Book do

  label :title

  list do
    sortable using: :foo
    field :subtitle
    field :description_excerpt
  end

  edit do
    group :name do
      field :title
      field :subtitle
    end
    field :description
  end

end
