class AdminController < ApplicationController
  def index
  end

  def show_posts
    @post = Post.all
  end

  def render_layout
	  render :layout => 'admin'
	end
end
