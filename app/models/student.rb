class Student < ApplicationRecord
  belongs_to :klass
  # ещё тут токены нужно будет хранить для аутентификации

  validates :first_name, :last_name, :surname, :school_id, presence: true
end
