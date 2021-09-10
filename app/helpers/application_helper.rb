module ApplicationHelper
  def render_if(condition, record)
    if condition
      render record
    end
  end

  def render_partial_if(condition, partial_path, msg = '')
    if condition
      render partial_path
    else
      msg
    end
  end
end
