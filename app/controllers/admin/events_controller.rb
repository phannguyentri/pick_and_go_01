class Admin::EventsController < AdminController
  before_action :load_event, except: [:index, :new, :create]
  before_action :load_destinations, only: [:new, :edit, :update]

  def index
    @events = Event.newest.page(params[:page]).per Settings.per_page
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:success] = t "view.admin.events.themthanhcong"
      redirect_to admin_events_url
    else
      render :new
    end
  end

  def update
    if @event.update_attributes event_params
      flash[:success] = t "view.admin.events.capnhapthanhcong"
      redirect_to admin_events_url
    else
      render :edit
    end
  end

  def destroy
    status_ok = true
    unless @event.destroy
      status_ok = false
    end
    respond_to do |format|
      format.json {
        render json: {status_ok: status_ok}
      }
    end
  end

  private

  def event_params
    params.require(:event).permit :title, :image, :content,
      :status, :time_start, :time_end, :destination_id
  end

  def load_event
    @event = Event.find_by id: params[:id]
    return if @event
    flash[:warning] = t "view.admin.events.loi"
    redirect_to admin_events_url
  end

  def load_destinations
    @destinations = Destination.all.name_asc
    return if @destinations.present?
    flash[:warning] = t "view.admin.events.loi_destination"
    redirect_to admin_events_url
  end
end
