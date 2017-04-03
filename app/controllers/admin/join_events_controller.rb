class Admin::JoinEventsController < AdminController
  before_action :load_event, only: [:index, :create]
  before_action :load_join_event, only: :destroy

  def index
    @join_events = JoinEvent.find_by_event(@event.id).newest.
      page(params[:page]).per Settings.per_page
  end

  def destroy
    status_ok = true
    unless @join_event.destroy
      status_ok = false
    end
    respond_to do |format|
      format.json {
        render json: {status_ok: status_ok}
      }
    end
  end

  private

  def load_join_event
    @join_event = JoinEvent.find_by id: params[:id]
    return if @join_event
    flash[:warning] = t "view.admin.events.loi"
    redirect_to admin_join_events_url
  end

  def load_event
    @event = Event.find_by id: params[:id]
    return if @event
    flash[:warning] = t "view.admin.events.loi"
    redirect_to admin_join_events_url
  end
end
