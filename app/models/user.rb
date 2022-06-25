# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  belongs_to :test

  def tests_by_level_title(level)
    Test.joins('JOIN test_passages on test_passages.test_id = tests.id')
        .where(level: level, test_passages: { user_id: id })
  end
end
