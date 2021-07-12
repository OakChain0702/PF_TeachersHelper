class WorkingsController < ApplicationController

  before_action :authenticate_user!

  def index
    teacher_id = params[:teacher_id]
    @teacher = Teacher.find(teacher_id)
    @workings = Working.all
    @working = Working.new
  end

  def create
    @working = Working.new(working_params)
    if @working.save
      redirect_to workings_path(teacher_id: @working.teacher_id)
    else
      render :index
    end
  end

  def edit
    @working = Working.find(params[:id])
    teacher_id = params[:teacher_id]
    @teacher = Teacher.find(teacher_id)
  end

  def update
    @working = Working.find(params[:id])
    if @working.update(working_params)
      redirect_to  workings_path(teacher_id: @working.teacher_id)
    else
      render :edit
    end
  end

  private

  def working_params
    params.require(:working).permit(:teacher_id, :subject_id, :start_at, :end_at)
  end


end
