class Admin::DestinationsController < AdminController
  before_action :load_destination, except: [:index, :new, :create]

  def index
    @destinations = Destination.newest.page(params[:page]).
      per Settings.per_page
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new destination_params
    if @destination.save
      flash[:success] = t "view.admin.destinations.themthanhcong"
      redirect_to admin_destinations_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @destination.update_attributes destination_params
      flash[:success] = t "view.admin.destinations.capnhapthanhcong"
      redirect_to admin_destinations_url
    else
      flash[:danger] = t "view.admin.destinations.capnhapthatbai"
      render :edit
    end
  end

  def destroy
    status_ok = true
    unless @destination.destroy
      status_ok = false
    end
    respond_to do |format|
      format.json {
        render json: {status_ok: status_ok}
      }
    end
  end

  private

  def destination_params
    params.require(:destination).permit :name, :image, :content, :description,
      :status
  end

  def load_destination
    @destination = Destination.find_by id: params[:id]
    return if @destination
    flash[:warning] = t "view.admin.destinations.loi"
    redirect_to admin_destinations_url
  end
end
