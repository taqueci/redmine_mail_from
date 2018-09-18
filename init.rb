require 'redmine'
require_dependency 'redmine_mail_from/hooks'
require_dependency 'redmine_mail_from/mailer_model_patch'

Redmine::Plugin.register :redmine_mail_from do
  name 'Redmine Mail From plugin'
  author 'Takeshi Nakamura'
  description 'Extends mail "From:" header field'
  version '2.0.0'
  url 'https://github.com/taqueci/redmine_mail_from'
  author_url 'https://github.com/taqueci'
end

Rails.configuration.to_prepare do
  unless Mailer.included_modules.include?(RedmineMailFrom::MailerModelPatch)
    Mailer.send(:prepend, RedmineMailFrom::MailerModelPatch)
  end
end
