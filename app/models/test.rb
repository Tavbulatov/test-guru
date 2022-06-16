class Test < ApplicationRecord
  def self.category_title(category)
   joins('JOIN categories on tests.category_id = categories.id')
  .where(categories: {title: category}).order(title: :desc).pluck('title')
  end
end
