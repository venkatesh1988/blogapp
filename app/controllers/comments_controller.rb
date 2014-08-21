class CommentsController < ApplicationController
  

  def create
    @article_show = Article.find params[:article_id]
    @comments = @article_show.comments.create comments_params
    
    if @comments.save
      redirect_to article_path(@article_show)
    end
  end

  def destroy
    @article_show = Article.find params[:article_id]
    @comments = @article_show.comments.find params[:id]
    if @comments.destroy
      redirect_to @article_show, notice: "comment deleted!"
    end
  end

  private


    def comments_params
    	params.require(:comment).permit(:commenter,:body)
    end
end
