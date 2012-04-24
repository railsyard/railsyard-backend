class Book < ActiveRecord::Base

  def description_excerpt
    if description.present?
      description[0..50] + "..."
    end
  end

end
