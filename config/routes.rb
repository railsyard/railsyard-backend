Rails.application.routes.draw do
  get "/backend" => "railsyard/static#index", :as => :backend_index

  scope "backend" do

    controller "railsyard/resources" do

      scope ":tableized_class_name", constraints: lambda { |r|
        require 'railsyard-backend/routes/editor_for_resource_constraint'
        Railsyard::Backend::Routes::EditorForResourceConstraint.new(r, :list).valid?
      } do

        match "/"        , to: :index   , via: :get    , as: :resources

      end

      scope ":tableized_class_name", constraints: lambda { |r|
        require 'railsyard-backend/routes/editor_for_resource_constraint'
        Railsyard::Backend::Routes::EditorForResourceConstraint.new(r, :edit).valid?
      } do

        match "/"        , to: :create  , via: :post   , as: :create_resource
        match "/reorder" , to: :reorder , via: :post   , as: :reorder_resources
        match "/new"     , to: :new     , via: :get    , as: :new_resource

        scope ":id" do
          match "/"     ,  to: :update  , via: :put    , as: :update_resource
          match "/"     ,  to: :destroy , via: :delete , as: :destroy_resource
          match "/edit" ,  to: :edit    , via: :get    , as: :edit_resource
        end

      end
    end

    controller "railsyard/instance" do
      scope ":underscore_class_name", constraints: lambda { |r|
        require 'railsyard-backend/routes/editor_for_instance_constraint'
        Railsyard::Backend::Routes::EditorForInstanceConstraint.new(r).valid?
      } do

        match "/"        , to: :update  , as: :update_instance , via: :put
        match "/edit"    , to: :edit    , as: :edit_instance   , via: :get

      end
    end
  end

end



