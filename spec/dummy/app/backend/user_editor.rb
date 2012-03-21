Railsyard.backend.define_editor_for User do

  label :full_name

  list do
    field :first_name
    field :last_name
    field :email
  end

  edit do
    field :first_name
    field :last_name
    field :email
    field :password
  end

end
