class Page < ActiveRecord::Base
  attr_accessible :parent_id, :title
  scope :roots, where(parent_id: nil)
  belongs_to :parent, class_name: "Page"

  def children
    Page.where(parent_id: self)
  end

end
