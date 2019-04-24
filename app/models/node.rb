# frozen_string_literal: true

class Node < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable, authentication_keys: [:mac]
  include DeviseTokenAuth::Concerns::User

  validates :mac, presence: :true, uniqueness: true #{ case_sensitive: false }

    # def email_required?
    #   false
    # end
    # # use this instead of email_changed? for rails >= 5.1
    # def will_save_change_to_email?
    #   false
    # end
end
