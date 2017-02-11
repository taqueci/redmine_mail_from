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

      placeholder = {
        '%f' => @author ? @author.firstname : nil,
        '%l' => @author ? @author.lastname : nil,
        '%m' => (@author && @author.mail && !@author.pref.hide_mail) ?
        @author.mail : nil,
        '%u' => @author ? @author.login : nil
      }

      from = ''

      Setting.mail_from.split(/\s*::\s*/).each do |s|
        nerr = 0

        placeholder.each do |key, val|
          next unless s.match(/#{key}/)

          if val.nil?
            nerr += 1
          else
            s.gsub!(/#{key}/, val)
          end
        end

        if nerr == 0
          from = s
          break
        end
      end

      headers['From'] = from

      mail_without_patch(headers, &block)
    end
  end
end

unless Mailer.included_modules.include?(RedmineMailFrom::MailerModelPatch)
  Mailer.send(:include, RedmineMailFrom::MailerModelPatch)
end
