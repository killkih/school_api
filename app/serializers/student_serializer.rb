class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :surname, :class_id, :school_id

  def class_id
    object.klass_id
  end
end
