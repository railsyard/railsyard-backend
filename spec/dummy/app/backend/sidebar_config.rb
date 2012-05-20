Railsyard::Backend.define_sidebar do

  group :resources do
    resource :book
  end

  group :settings do
    instance :settings
  end

end
