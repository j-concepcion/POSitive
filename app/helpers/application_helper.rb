module ApplicationHelper
  def form_error_notification(form)
    unless form.object.errors.blank?
      error_messages = []
      if form.object.errors.include?(:base)
        error_messages << form.object.errors.full_messages_for(:base).join('. ') + "."
        form.object.errors.delete(:base)
      end
      error_messages << 'Please review the problems below:' unless form.object.errors.blank?
      content_tag :div, nil,  class: 'alert alert-danger', role: 'alert' do
        error_messages.collect do |msg|
          content_tag :p, msg
        end.join.html_safe
      end
    end
  end
end
