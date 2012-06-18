module ApplicationHelper
  include PostsHelper

  def full_title title = nil
    unless title.blank?
      "Ruby-Tips | #{title}"
    else
      "Ruby-Tips"
    end
  end

  def tags_count
    Tag.tags.length
  end
end
