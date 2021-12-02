class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    if @comment.save
      render 'create'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id]).destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
