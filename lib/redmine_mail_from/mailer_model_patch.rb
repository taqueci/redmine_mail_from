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

      if @author
        firstname = @author.firstname || ''
        lastname  = @author.lastname || ''
        mail = (@author.mail && !@author.pref.hide_mail) ? @author.mail : ''
        login = @author.login || ''
      else
        firstname = ''
        lastname  = ''
        mail      = ''
        login     = ''
      end

      from.gsub!(/%f/, firstname)
      from.gsub!(/%l/, lastname)
      from.gsub!(/%m/, mail)
      from.gsub!(/%u/, login)

      headers['From'] = from

      mail_without_patch(headers, &block)
    end
  end
end

unless Mailer.included_modules.include?(RedmineMailFrom::MailerModelPatch)
  Mailer.send(:include, RedmineMailFrom::MailerModelPatch)
end
