module NavActiveHelper
  def nav_active(path)
    if current_page.path == path
      " active"
    end
  end
end
