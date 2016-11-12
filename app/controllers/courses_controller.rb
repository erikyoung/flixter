class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def photo_params
    params.require(:course).permit(:id)
  end
end
