module ApplicationHelper
  def render_if(condition, record)
    if condition
      render record
    end
  end

  def render_partial_if(condition, partial_path)
    if condition
      render partial_path
    end
  end
end
