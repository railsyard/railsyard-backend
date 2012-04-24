module DomHelpers

  def find_rel(rel)
    xpath = "//*[contains(concat(' ',normalize-space(@rel),' '),' #{rel} ')]"
    find(:xpath, xpath)
  end

  def dom_id_for(record)
    "#" + ActionController::RecordIdentifier.dom_id(record)
  end

  def dom_class_for(record)
    "." + ActionController::RecordIdentifier.dom_class(record)
  end

end

RSpec.configuration.include DomHelpers, type: :request
