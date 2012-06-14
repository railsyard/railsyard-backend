class Book < ActiveRecord::Base

  scope :search, Proc.new { |key|
    where("title LIKE ?", "%#{key}%")
  }

  def description_excerpt
    if description.present?
      description[0..50] + "..."
    end
  end

end
