class ArticlesController < ApplicationController  
  before_action :authenticate_user!
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
  end
  
  def new
    @articles = Article.new
  end

  def create
    @articles = Article.create articles_params
    if @articles.save
      flash[:noticeuser] = "Article is successfully created!"
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
        flash[:noticeuser] = "Article is successfully edited!"
    end
  end

  

  def destroy
    @article_delete = Article.find params[:id]
    if @article_delete.destroy
      redirect_to articles_path
      flash[:noticeuser] = "Article is successfully deleted!"
    end

  end

  private
   def articles_params
     # params.require(:article).permit(:title,:content,{ tag_list: [] })
      params.require(:article).permit(:title,:content, :tag_list)
   end
end
