class Account::UsersController < AccountController
  def index
    @users = User.all
    authorize @users
  end

  def resend_invitation
    @user = User.find(params[:id])
    authorize @user, :create?

    if @user.created_by_invite? && @user.invitation_accepted? == false
      @user.invite!
      redirect_to account_users_path, notice: "Reinvited user."
    else
      redirect_to account_users_path, alert: "User is already active."
    end
  end
end
