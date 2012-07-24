module AlertHelpers

  def accept_alert
    page.driver.browser.switch_to.alert.accept
  end

end

RSpec.configuration.include AlertHelpers, type: :request

