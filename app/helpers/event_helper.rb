module EventHelper
  def check_status_event time_start, time_end
    if Time.now.to_date < time_start.to_date
      "<span class='label label-warning'>" <<
        t('view.admin.events.chuachophepdangky') << "</span>"
    elsif Time.now.to_date >= time_start.to_date &&
      Time.now.to_date <= time_end.to_date
      "<span class='label label-success'>" <<
        t("view.admin.events.chophepdangky") << "</span>"
    else
      "<span class='label label-danger'>" <<
        t("view.admin.events.daketthuc") << "</span>"
    end
  end
end
