class Book < ActiveRecord::Base

  scope :search, Proc.new { |key|
    where("title LIKE ?", "%#{key}%")
  }

  default_scope order(:position)

  has_one :author
  accepts_nested_attributes_for :author

  def description_excerpt
    if description.present?
      description[0..50] + "..."
    end
  end

end
