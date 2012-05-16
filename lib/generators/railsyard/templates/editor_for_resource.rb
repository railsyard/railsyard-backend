Railsyard::Backend.define_editor_for <%= class_name %> do

  list do
    label :<%= @attributes.first.name %>

    field :created_at
  end

  edit do
<% @attributes.each do |a| -%>
    field :<%= a.name %>
<% end -%>
  end

end
