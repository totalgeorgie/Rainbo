module ApplicationHelper
  def maybe_active(page)
    'dashboard-link-active' if page
  end
end
