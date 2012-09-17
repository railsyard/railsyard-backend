Railsyard.define_editor_for Book do

  label :title

  list do
    searchable with_scope: :search
    paginates per: 5
    sortable
    field :subtitle
    field :description_excerpt
  end

  edit do
    group :name do
      field :title
      field :subtitle
    end
    nested :author do
      field :first_name
      field :last_name
    end
    field :description
  end

end
