class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
    @users =User.where.not(id: current_user.id)
    @friendship = Friendship.new
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    # @friendship = Friendship.new(friendship_params)

    # return puts (params["friendship"]["friend_id"])
     @friendship = Friendship.select('*').where(friend_id: params["friendship"]["friend_id"] , user_id: current_user  )
   
    if @friendship.size.zero?
    @friendship = Friendship.new(friendship_params)
    @friendship.user_id=current_user.id
    @users=User.all 
    @current_user

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to friendships_url, notice: 'Friendship was successfully created.' }
        format.json { render :index, status: :created, location: @friendship }
      else
        format.html { render :index }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  else
    respond_to do |format|
      format.html { redirect_to friendships_path, notice: 'User already exists.' }
    end

  end

  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :group_id)
    end
end
