class User < ApplicationRecord
  has_many:authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :attempts, dependent: :destroy
  has_many :tests, through: :attempts

  def find_tests_by_level(level)
    tests.where(level: level)
  end
end
