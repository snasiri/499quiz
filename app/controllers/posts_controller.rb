class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

helper_method :count

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
    #@post = Post.new(post_params)

    #respond_to do |format|
      #if @post.save
        #format.html { redirect_to @post, notice: 'Post was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @post }
      #else
        #format.html { render action: 'new' }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      #end
    #end

    #updated from hartl's micropost section (10.27) le - 03012014
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post Created Successfully!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to root_url
#    respond_to do |format|
 #     format.html { redirect_to posts_url }
  #    format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
    rescue
      redirect_to root_url if @post.nil?
    end
end
