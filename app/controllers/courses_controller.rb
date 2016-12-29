class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @course.update_attributes(course_params)
    redirect_to root_path
  end

end

