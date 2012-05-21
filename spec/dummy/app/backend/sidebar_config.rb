Railsyard::Backend.define_sidebar do

  group :resources do
    resource Book
  end

  group :settings do
    instance Settings
  end

end
