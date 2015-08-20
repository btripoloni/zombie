class ApplicationController < ActionController::Base
	before_filter :verify_installation

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def verify_installation
  	@blog = Blog.first
  	unless @blog
  		redirect_to new_blog_path
  	end
  end
end
