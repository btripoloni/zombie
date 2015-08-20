class AdminController < ApplicationController
	#before_filter :render_layout

  def index
  end

	def render_layout
		render :layout => 'admin'
	end
end
