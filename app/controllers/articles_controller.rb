class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index 
    @articles = Article.all

    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search_term]
    category_type = params[:category]

    if search_term
      @articles = @articles.where("title iLIKE ? OR text iLIKE ?", 
                                "%#{search_term}%",
                                "%#{search_term}%")
    end
    
    if category_type
      category = Category.find_by(name: category_type)
      @articles = category.articles
    end

    if sort_attribute && sort_order
      @articles = @articles.order(sort_attribute => sort_order)
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(
                           title: params[:title],
                           text: params[:text],
                           user_id: current_user.id,
                           category_id: params[:category][:category_id]

                          )
    if @article.save && @article.article_categories.create(article_id: @article.id, category_id: params[:category][:category_id])
      flash[:success] = "Article #{@article.title} Created Successfully."
      redirect_to "/articles/#{@article.id}"
    else
      render :new 
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    @article.assign_attributes(
                               title: params[:title],
                               text: params[:text],
                               user_id: current_user.id
                               )

    if @article.save
      flash[:success] = "Article #{@article.title} Updated Successfully."
      redirect_to "/articles/#{@article.id}"
    else
      render :edit 
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    flash[:warning] = "Article #{article.title} Deleted Successfully."
    redirect_to "/articles"
  end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
