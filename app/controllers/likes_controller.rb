class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]

  # GET /likes or /likes.json
  def index
    @likes = Like.all
  end


  # GET /likes/new
  def new
    @like = Like.new
  end


  # POST /likes or /likes.json
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user_id = current_user.id
    @like.save

    respond_to do |format|
      if @like.save
        format.html { redirect_to root_path, notice: "Like was successfully created." }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { redirect_to root_path }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end




end
