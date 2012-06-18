class Book < ActiveRecord::Base

  scope :search, Proc.new { |key|
    where("title LIKE ?", "%#{key}%")
  }

  default_scope order(:position)

  def description_excerpt
    if description.present?
      description[0..50] + "..."
    end
  end

end
