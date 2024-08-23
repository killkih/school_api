class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :surname, :klass_id, :school_id
end
