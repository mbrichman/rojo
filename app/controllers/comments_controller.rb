class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.user_id = params[:user_id]
    @comment.comment = params[:comment]
    @comment.post_id = params[:post_id]

    if @comment.save
            redirect_to comments_url
          else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    @comment.user_id = params[:user_id]
    @comment.comment = params[:comment]

    if @comment.save
            redirect_to comments_url
          else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
        redirect_to comments_url
      end
end
