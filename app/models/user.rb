class User < ApplicationRecord
  def tests_by_level(level)
    TestPassage.joins('JOIN tests on test_passages.test_id = tests.id')
    .where(user_id: id, tests: { level: level}).pluck('title')
  end
end
