class Test < ApplicationRecord
  def self.category_title(category)
  category_id = Category.where(title: category).ids
  Test.where(category_id: category_id).order(title: :desc).pluck(:title)
  end
end
