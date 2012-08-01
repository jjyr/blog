class PostsController < ApplicationController

  before_filter :check_role,only: [:new,:edit,:create,:update,:destroy]
  cache_sweeper :post_sweeper,:tag_sweeper

  # GET /posts
  # GET /posts.json
  def index
    unless fragment_exist? "posts#index#{admin?}",page: params[:page] || 1
      @posts = Post.paginate page: params[:page]
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    unless fragment_exist?("posts#show#{params[:id]}") && fragment_exist?("posts#show#comments#{params[:id]}")
      @post = Post.find(params[:id]) 
      @comments = @post.comments.all
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id]) unless fragment_exist? "posts#edit#{params[:id]}"
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    if @post.save
      if tags = params[:tags]
        add_tags @post,tags
      end
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      if tags = params[:tags]
        update_tags @post,tags
      end
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end
end
