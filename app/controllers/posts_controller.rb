class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  layout 'admin', only: [:new, :edit]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.includes(:comments).paginate(page: params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: t('post.success') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: t('post.updated') }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: t('post.destroyed') }
      format.json { head :no_content }
    end
  end

  def destroy_multiple_posts
    params[:post].each do |key, value|
      @post = Post.find(value)
      @post.destroy
    end
    redirect_to admin_show_posts_path, notice: t('post.multiple_destroyed', size: params[:post].size)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :tag_list)
    end

    def render_admin
    render :layout => 'admin'
  end
end
