class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, commentable_id, body)
    @comment.user = User.find_by nick: cookies[:login]

    respond_to do |format|
      if @comment.save
        make_child_comment
        if !cookies[:return_to].nil?
        	format.html  { redirect_to cookies[:return_to],:notice => "Comentário postado com Sucesso!" }
        else
        	format.html  { redirect_to '/videos' }
        end
      else
        format.html  { redirect_to cookies[:return_to],:notice => "É preciso estar logado para comentar" }
      end
      cookies.delete [:return_to]
    end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	respond_to do |format|
      format.html { redirect_to cookies[:return_to], notice: 'Comentário deletado com sucesso!' }
      format.json { head :no_content }
      cookies.delete [:return_to]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

  def comment_id
    comment_params[:comment_id]
  end

  def body
    comment_params[:body]
  end

  def make_child_comment
    return "" if comment_id.blank?

    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end

end
