module ApplicationHelper
  def controller_with_action
    "#{controller_name}_#{action_name}".to_sym
  end
end
