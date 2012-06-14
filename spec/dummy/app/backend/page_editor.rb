Railsyard::Backend.define_editor_for Page do

  label :title

  list do
    as_tree
    sortable using: :parent_id
    field :subtitle
    field :created_at
  end

  edit do
    field :title
    field :parent
  end

end
