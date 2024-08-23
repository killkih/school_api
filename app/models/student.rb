class Student < ApplicationRecord
  belongs_to :klass

  validates :first_name, :last_name, :surname, :school_id, presence: true
end
