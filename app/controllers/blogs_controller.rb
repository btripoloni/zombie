class BlogsController < ActionController::Base
  before_action :set_blog, only: [:edit, :update]

  # GET /blogs/new
  def new
    unless Blog.first
      @blog = Blog.new
    else
      redirect_to admin_path, notice: t("blog.failed_wellcome")
    end
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to root_path, notice: t('blog.wellcome') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to admin_path, notice: t('blog.update') }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:name, :description)
    end
end
