# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.tests_by_category_title(category)
    joins('JOIN categories on tests.category_id = categories.id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
