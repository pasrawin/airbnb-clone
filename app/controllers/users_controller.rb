class UsersController < Clearance::UsersController

  before_action

  # index = clearance default

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = User.new(user_from_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "statics/home"
    end
  end

  def show
    @user = current_user
    @bookings = @user.bookings
  end

  def edit
  end

  private
  def user_from_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end


end
