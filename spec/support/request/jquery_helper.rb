module JqueryHelpers

  def wait_until_animation_end
    wait_until do
      page.evaluate_script('$(":animated").length') == 0
    end
  end

end

RSpec.configuration.include JqueryHelpers, type: :request
