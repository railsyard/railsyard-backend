class MyPluginCell < Cell::Rails

  def hello_world(settings)
    @settings = settings
    render
  end

end
