require 'readability'
require 'open-uri'

class PostsController < ApplicationController

  def index
    @posts = Post.where(:user_id => session[:user_id])
    @allposts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def import

  end

  def add
    url = params[:url]
    source = open(url).read
    document =  Readability::Document.new(source)
    create(document, url)
  end

  def create(doc, url)
    document = doc
    @post = Post.new
    @post.user_id = session[:user_id]
    @post.title = document.title
    @post.body = document.content
    # @post.date = params[:date]
    @post.url = url

    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.user_id = session[:user_id]
    @post.title = params[:title]
    @post.body = params[:body]
    @post.date = params[:date]

    if @post.save
            redirect_to posts_url
          else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
        redirect_to posts_url
      end
end
