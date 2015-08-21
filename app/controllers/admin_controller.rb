class AdminController < ApplicationController
  def index
  end

  def render_layout
		render :layout => 'admin'
	end
end
