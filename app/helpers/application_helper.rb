module ApplicationHelper

  TIME_ZONE = "Beijing"

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

  def format_date date
    date.localtime.in_time_zone(ApplicationHelper::TIME_ZONE).strftime "%Y-%m-%d %H:%M:%S"
  end
end
