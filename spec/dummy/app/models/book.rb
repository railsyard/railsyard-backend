class Book < ActiveRecord::Base

  def description_excerpt
    description[0..50] + "..."
  end

end
