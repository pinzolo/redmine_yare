# coding: utf-8
module Yare
  class ShowIssuesListner < Redmine::Hook::ViewListener
    def view_layouts_base_body_bottom(context = {})
      return nil unless User.current.logged?

      issues = Issue.includes(:status).where(:assigned_to_id => User.current.id, :due_date => Date.today).delete_if { |issue| issue.closed? }
      return nil if issues.empty?

      context[:controller].render_to_string("hooks/show_issues", :locals => { :issues => issues }, :layout => false)
    end
  end
end
