class Tag < ApplicationRecord
  belongs_to :photo

  def update_tag(tag_attribute)
    self.name = tag_attribute.first['name']
  end
end

