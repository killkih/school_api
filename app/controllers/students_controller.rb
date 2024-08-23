class StudentsController < ApplicationController

  before_action :set_student, only: :destroy

  def create
    @klass = Klass.find(params[:klass_id])
    @student = @klass.students.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
  end

  private

  def set_student
    @student ||= Student.find(params[:id]) if params[:id]
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end
end
