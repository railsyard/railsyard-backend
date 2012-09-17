Railsyard.plugin_manager.add_plugin(:my_plugin) do
  name "My silly plugin"
  dashboard_widget :hello_world, cell: :my_plugin, action: :hello_world
end
