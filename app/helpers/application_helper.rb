module ApplicationHelper

  TIME_ZONE = "Beijing"

  include PostsHelper

  def full_title title = nil
    unless title.blank?
      "#{title} | Ruby-Tips"
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

  def admin_user
    @admin_user ||= User.first
  end

  def markdown text
    options = {autolink: true,space_after_headers: true,fenced_code_blocks: false,no_intra_emphasis: true,hard_wrap: true,strikethrough: true}
    markdown = Redcarpet::Markdown.new HTMLwithCodeRay,options
    markdown.render(text).html_safe
  end

  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code code,language
      CodeRay.scan(code,language).div tab_width: 2
    end
  end
end
