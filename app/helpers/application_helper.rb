module ApplicationHelper

  def ftime(time)
    time = time.localtime
    time.strftime("%B %dth, %Y at %I:%M %p")
  end
end
