class InstallController < ActionController::Base
	before_filter :block_multiple_installations
  def index
  	@blog = Info.new
  end

  def create
  	@blog = Info.new(info_params)
  	@blog.save
  	redirect_to root_path, notice: t("install.wellcome")
  end

  private
  def info_params
  	params.require(:info).permit(:blog_name, :description)
  end

  def block_multiple_installations
  	if Info.all
  		redirect_to root_path
  	end
  end
end
