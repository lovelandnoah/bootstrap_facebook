class PostsController < ApplicationController
  before_action :findpost, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all
  end

  def show
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render :edit
  	end
  end

  def destroy
  	@post.delete
  	redirect_to :root
  end

  private

  	def findpost
  		@post = Post.find(params[:id])
  	end

  	def post_params
  		params.require(:post).permit(:author, :title, :body)
  	end
 end
