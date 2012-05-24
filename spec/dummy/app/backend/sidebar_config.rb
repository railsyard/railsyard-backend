Railsyard::Backend.define_sidebar do

  group do
    resource Book
  end

  group :settings do
    instance Settings
  end

  group :links do
    link "Railsyard", "http://railsyardcms.org", target: "_blank"
  end

end
