class Klass < ApplicationRecord
  has_many :students

  validates :number, :letter, :students_count, presence: true
end
