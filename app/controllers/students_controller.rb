class StudentsController < ApplicationController

  def index
    @students = Student.where(school_id: params[:school_id], klass_id: params[:class_id])
    render json: @students
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      @student.assign_token!
      response.headers['X-Auth-Token'] = @student.token
      render json: @student, status: :created, location: @student
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])

    if @student
      if bearer_token == @student.token
        @student.destroy
      else
        render json: { error: 'Некорректная авторизация' }, status: :unauthorized
      end
    else
      render json: { error: 'Некорректный id' }, status: :bad_request
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :klass_id, :surname, :school_id)
  end
end
