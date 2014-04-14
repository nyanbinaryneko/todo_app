class TaskDecorator < ApplicationDecorator
  delegate_all

  decorates_association :list

  def status_class
    case object.status
      when 'pending'
        'warning'
      when 'complete'
        'success'
      else
        ''
    end
  end

  def render_status
    h.content_tag :span, class: "label label-#{status_class}" do
      object.status_text
    end
  end
end