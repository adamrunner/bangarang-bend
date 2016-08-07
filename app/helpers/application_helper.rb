module ApplicationHelper

  def ftime(time)
    time = time.localtime
    time.strftime("%B %-dth, %Y")
  end

  def caps_first(string)
    string.split.map(&:capitalize).join(' ')
  end

end
