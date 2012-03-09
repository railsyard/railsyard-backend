Rails.application.routes.draw do
  match "/backend" => "railsyard/static#index"
end
