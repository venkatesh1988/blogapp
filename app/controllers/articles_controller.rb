class ArticlesController < ApplicationController  

  def index
    @articles = Article.all
  end
  
  def new
    @articles = Article.new
  end

  def create
    @articles = Article.create articles_params
    if @articles.save
      redirect_to articles_path
    end
  end  

  def edit
    @article_edit = Article.find params[:id]
  end

  
  def show
    @article_show = Article.find params[:id]
  end
  
  def update 
    @article_update = Article.find params[:id]
    if @article_update.update_attributes articles_params 
        redirect_to articles_path
    end
  end

  def destroy
    @article_delete = Article.find params[:id]
    if @article_delete.destroy
      redirect_to articles_path
    end

  end

  private
   def articles_params
      params.require(:articles).permit(:title,:content)
   end
end
