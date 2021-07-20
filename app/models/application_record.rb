class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :trackable, :lockable, :validatable

  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end
end
