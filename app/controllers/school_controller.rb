class SchoolController < ApplicationController
  def index
  	@schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def edit
    @school = School.find(params[:id])
  end

  def create
  	# *** 1. Render Plaing Object ***
  	# render plain: params[:school].inspect

  	# *** 2. Error : "ActiveModel::ForbiddenAttributesError in SchoolController#create" ***
  	# @school = School.new(params[:school])

  	# *** 3. require and permit ***
  	# @school = School.new(params.require(:school).permit(:name, :code, :address))

  	@school = School.new(school_params)
  	if @school.save
  	 redirect_to @school
    else
      render 'new'
    end
  end

  def update
    @school = School.find(params[:id])
   
    if @school.update(school_params)
      redirect_to @school
    else
      render 'edit'
    end
  end


  def destroy
    @school = School.find(params[:id])
    @school.destroy

    redirect_to action:'index'
  end

  private
  def school_params
  	params.require(:school).permit(:name, :code, :address)
  end
end