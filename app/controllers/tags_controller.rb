class TagsController < ApplicationController

  def index
    unless fragment_exist? 'tags#index',page: params[:page] || 1
      @tags = Tag.tags.paginate page: params[:page]
    end
  end

  def show
    unless fragment_exist? "tags#show#{params[:id]}",page: params[:page] || 1
      @tags = Tag.find_tags_by_name(params[:id]).includes(:post).paginate page: params[:page]
      @posts = @tags.map &:post
    end
  end
end
