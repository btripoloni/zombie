class ApplicationController < ActionController::Base
	before_filter :startup

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :blog

  def blog
    Rails.cache.read('blog')
  end

  def startup
    cache = Rails.cache
    unless cache.read('blog')
      cache.write('blog', Blog.first)
    end
  end
end
