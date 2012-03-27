Rails.application.routes.draw do
  get "/backend" => "railsyard/static#index", :as => :backend_index

  scope "backend" do
    controller "railsyard/backend" do
      scope ":resource_class" do
        match "/"    , to: :index  , as: :index  , via: :get
        match "/"    , to: :create , as: :create , via: :post
        match "/new" , to: :new    , as: :new    , via: :get
        scope ":id" do
          match "/"       , to: :show    , as: :show    , via: :get
          match "/"       , to: :update  , as: :update  , via: :put
          match "/"       , to: :destroy , as: :destroy , via: :delete
          match "/edit"   , to: :edit    , as: :edit    , via: :get
        end
      end
    end
  end

end
