class Page < ActiveRecord::Base
  attr_accessible :parent, :title, :position
  scope :roots, where(parent_id: nil)
  belongs_to :parent, class_name: "Page"
  default_scope order(:position)

  def children
    Page.where(parent_id: self)
  end

end
