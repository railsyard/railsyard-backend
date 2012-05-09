class Settings < ActiveRecord::Base
  attr_accessible :footer

  def self.instance
    self.create if self.count.zero?
    self.first
  end

end
