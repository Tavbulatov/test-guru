class User < ApplicationRecord
  def tests_by_level_title(level)
    Test.joins('JOIN test_passages on test_passages.test_id = tests.id')
      .where(level: level, test_passages: { user_id: id })
  end
end
