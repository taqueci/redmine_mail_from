module RedmineMailFrom
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_settings_general_form,
              :partial => 'hooks/redmine_mail_from/settings'
  end
end
