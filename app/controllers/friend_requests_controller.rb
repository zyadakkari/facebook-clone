class FriendRequestsController < ApplicationController
    before_action :set_friend_request, except: [:index, :create]

    def create
      @user = current_user
      @friend_request = @user.friend_requests.build(friend_id: params[:friend_id])
      @friend_request.user_id = current_user.id

      if @friend_request.save
        render 'friends/index' , status: :created
      else
        render json: @friend_request.errors, status: :unprocessable_entity
      end
    end



    def index
      @incoming = FriendRequest.where(friend: current_user)
      @outgoing = current_user.friend_requests
    end

    def destroy
      @friend_request.destroy
      head :no_content
    end

    def update
      @friend_request.accept
      head :no_content
    end

    private

    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end

end
