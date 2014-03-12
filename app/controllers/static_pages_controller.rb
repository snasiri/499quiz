class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  	@user = current_user
  	@post = current_user.posts.build
  	@feed_items = current_user.feed.paginate(page: params[:page])
  end
  end

  def aboutus
  end
end
