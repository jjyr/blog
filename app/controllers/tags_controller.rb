class TagsController < ApplicationController
  caches_page :index
  caches_page :show

  def index
    unless fragment_exist? 'tags#index',page: params[:page] || 1
      @tags = Tag.tags.paginate page: params[:page]
    end
  end

  def show
    @tags = Tag.find_tags_by_name(params[:id]).includes(:post).paginate page: params[:page]
    logger.info "#" * 200 + @tags.inspect
    @posts = @tags.map &:post
    logger.info "*" * 200 + @posts.inspect
  end
end
