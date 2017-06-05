require 'redmine'
require_dependency 'redmine_mail_from/hooks'

Rails.configuration.to_prepare do
  require_dependency 'redmine_mail_from/mailer_model_patch'
end

Redmine::Plugin.register :redmine_mail_from do
  name 'Redmine Mail From plugin'
  author 'Takeshi Nakamura'
  description 'Extends mail "From:" header field'
  version '1.3.0'
  url 'https://github.com/taqueci/redmine_mail_from'
  author_url 'https://github.com/taqueci'
end
