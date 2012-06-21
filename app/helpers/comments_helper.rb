require 'digest/md5'
module CommentsHelper
  def gravatar_url_for email,opt = {size: 40}
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email.strip.downcase)}?s=#{opt[:size]}"
  end

  def gravatar_for email,opt = {size: 50}
    gravatar_url = gravatar_url_for email,opt
    link_to image_tag(gravatar_url,height: opt[:size],width: opt[:size],alt: "Icon"),"http://gravatar.com/",class: "thumbnail"
  end

  def comment_number
    @comment_number = 0 if @comment_number.nil?
    "\##{@comment_number += 1}"
  end
end
