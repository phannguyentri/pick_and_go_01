class Admin::UsersController < AdminController
  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = User.newest.page(params[:page]).per Settings.per_page
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "view.admin.users.themthanhcong"
    else
      flash[:danger] = t "view.admin.users.themthatbai"
    end
    redirect_to  admin_users_url
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "view.admin.users.capnhapthanhcong"
    else
      flash[:danger] = t "view.admin.users.capnhapthatbai"
    end
    redirect_to admin_users_url
  end

  def destroy
    status_ok = true
    unless @user.destroy
      status_ok = false
    end
    respond_to do |format|
      format.json {
        render json: {status_ok: status_ok}
      }
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone, :address, :image, :is_admin
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "view.admin.users.loi"
    redirect_to admin_users_path
  end
end
