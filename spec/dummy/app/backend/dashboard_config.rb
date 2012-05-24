Railsyard::Backend.define_dashboard do

  column do
    widget :hello_world do
      name "Mickey Mouse"
    end
  end

  column do
    widget :hello_world, :foo_bar do
      name "Foo"
    end
  end

end

