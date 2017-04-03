class Admin::NotificationEventsController < AdminController
  before_action :load_event, only: [:index, :create]
  before_action :load_join_event, only: :destroy

  def create
    if params[:title] && params[:content]
      @join_events = JoinEvent.find_by_event @event.id
      @join_user = []
      @join_events.each do |join_event|
        @join_user << join_event.user
      end
      title = params[:title]
      content = params[:content]
      @join_user.each do |user|
        NotificationEventMailer.send_mail_user_join(user, title, content).
          deliver_now
      end
      flash[:success] = t "view.admin.join_events.guithongbaothanhcong"
    else
      flash[:danger] = t "view.admin.join_events.guithongbaothatbai"
    end
    redirect_to admin_join_events_path id: @event.id
  end

  private

  def load_event
    @event = Event.find_by id: params[:id]
    return if @event
    flash[:warning] = t "view.admin.events.loi"
    redirect_to admin_join_events_url
  end
end
