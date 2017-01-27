require_dependency 'mailer'

module RedmineMailFrom
  module MailerModelPatch
    def self.included(base)
      base.send(:include, InstanceMethods)

      base.class_eval do
        alias_method_chain :mail, :patch
      end
    end
  end

  module InstanceMethods
    def mail_with_patch(headers={}, &block)
      from = Setting.mail_from.dup

      from.gsub!(/%f/, @author.firstname || '')
      from.gsub!(/%l/, @author.lastname || '')
      from.gsub!(/%m/, (@author.mail && !@author.pref.hide_mail) ? @author.mail : '')
      from.gsub!(/%u/, @author.login || '')

      headers['From'] = from

      mail_without_patch(headers, &block)
    end
  end
end

unless Mailer.included_modules.include?(RedmineMailFrom::MailerModelPatch)
  Mailer.send(:include, RedmineMailFrom::MailerModelPatch)
end
