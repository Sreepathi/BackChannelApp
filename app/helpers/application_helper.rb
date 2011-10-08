module ApplicationHelper

  def logo
    image_tag("logo.gif", :alt => "BackChannel App", :class => "round")
  end
end
