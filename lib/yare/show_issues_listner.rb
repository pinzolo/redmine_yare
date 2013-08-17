# coding: utf-8
module Yare
  class ShowIssuesListner < Redmine::Hook::ViewListener
    def view_layouts_base_body_bottom(context = {})
      html = ""
      return html unless User.current.logged?

      issues = Issue.includes(:status).where(:assigned_to_id => User.current.id, :due_date => Date.today).delete_if { |issue| issue.closed? }
      return html if issues.empty?

      html << %(<div id="yare" title="#{l(:yare_dialog_title)}">)
      html << %(<ul>)
      issues.each do |issue|
        html << %(<li class="yare_issue">#{link_to issue.id, issue_path(issue)} : #{issue.subject}</li>)
      end
      html << %(</ul>)
      html << %(</div>)
      html << %(<script>$("#yare").dialog({modal: true});</script>)
      return html
    end
  end
end
