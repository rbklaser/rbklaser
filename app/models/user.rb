require 'digest/sha1'

class User < ActiveRecord::Base
      validates_presence_of :name
      validates_presence_of :sec_name
      validates_presence_of :nrdziennika
      #validates_presence_of :is_admin
      validates_presence_of :pass
      validates_presence_of :email
      
      validates_format_of :email, :with => /^(?:(?:[\-+%=_'a-z0-9]+)(?:\.(?![\.@]))?)+@(?:[a-z0-9\-]+\.)+[a-z]+/,
      	:message => "Invalid format"

      validates_confirmation_of :email
      validates_confirmation_of :pass
      validates_presence_of :email_confirmation
      validates_presence_of :pass_confirmation
      
      validates_numericality_of :nrtel
      validates_uniqueness_of :email, :nrdziennika
      
      # Paperclip
      has_attached_file :photo, :styles => {
          :normal => "100x100>"
        }
      
      before_save :salt_password
      
      def self.auth(email_try, pass_try)
      	      pass_try = Digest::SHA1.hexdigest(pass_try)
      	      u = User.where("email = ? AND pass = ?", email_try, pass_try)
      	      return u unless u.blank?
      	      nil
      end
      	      
      protected
      def salt_password
      	      self.pass = Digest::SHA1.hexdigest(self.pass)
      end
end
