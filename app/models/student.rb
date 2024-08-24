require 'digest'

class Student < ApplicationRecord
  belongs_to :klass

  validates :first_name, :last_name, :surname, :school_id, presence: true

  def assign_token!
    self.update(token: generate_token)
  end

  private

  def generate_token
    Digest::SHA256.hexdigest("#{self.id}-#{Rails.application.secrets.secret_key_base}")
  end
end
