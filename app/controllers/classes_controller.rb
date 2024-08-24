class ClassesController < ApplicationController

  def index
    @klasses = Klass.joins(:students).where(students: { school_id: params[:school_id] }).distinct
    render json: @klasses
  end
end
