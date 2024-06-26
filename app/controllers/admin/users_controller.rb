module Admin
  class UsersController < AdminController
    def index
      @users = User.all.order(created_at: :desc)
    end
  end
end
