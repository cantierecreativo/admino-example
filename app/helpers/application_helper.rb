module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'alert' then "alert alert-error"
    end
  end
end

