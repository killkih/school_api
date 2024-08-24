class StudentsController < ApplicationController

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # дописать логику для 400, 401
  def destroy
    @student ||= Student.find(params[:id]) if params[:id]
    @student.destroy
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end
end
