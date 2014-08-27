class CommentsController < ApplicationController
  respond_to :html, :js

  def create
        @article_show = Article.find params[:article_id]
        @comments = @article_show.comments.create comments_params
        flash[:notice] = "Comment Added!"
        respond_to do |format|
        if @comments.save
          format.html {redirect_to article_path(@article_show),notice: "Comment Added!" }
          format.js { }
        end
      end
        # respond_to do |format|
        # format.html { redirect_to @article_show,:notice => 'comment successfully added!'}
        # format.json { redirect_to @article_show, :notice => 'comment successfully added'}
  end

  def destroy
    @article_show = Article.find params[:article_id]
    @comments = @article_show.comments.find params[:id]
    if @comments.destroy
      redirect_to @article_show, notice: "Comment Deleted!"
    end
  end

  private
    def comments_params
    	params.require(:comment).permit(:commenter,:body)
    end
end
