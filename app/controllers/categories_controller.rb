class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(
                              name: params[:name],
                              user_id: current_user.id
                            )
    if @category.save 
      flash[:success] = "Category #{@category.name} Created Successfully."
      redirect_to "/categories"
    else
      render :new 
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    @category.assign_attributes(
                               name: params[:name],                        
                               user_id: current_user.id
                               )

    if @category.save 
      flash[:success] = "Category #{@category.name} Updated Successfully."
      redirect_to "/categories"
    else
      render :edit 
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:warning] = "Category #{category.name} Deleted Successfully."
    redirect_to "/categories"
  end
end
