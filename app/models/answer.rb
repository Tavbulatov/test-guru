# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :true_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count_number_answers

  def validate_count_number_answers
    errors.add(:answers, 'limit is 4') if question.answers.size >= 4
  end
end
