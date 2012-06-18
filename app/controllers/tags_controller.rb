class TagsController < ApplicationController
  def index
    @tags = Tag.tags.paginate page: params[:page]
  end

  def show
    @tags = Tag.find_tags_by_name(params[:id]).paginate page: params[:page]
    @posts = @tags.map &:post
  end
end
