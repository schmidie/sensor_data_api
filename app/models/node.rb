# frozen_string_literal: true

class Node < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, authentication_keys: [:mac]
  include DeviseTokenAuth::Concerns::User

  validates :mac, presence: :true, uniqueness: true #{ case_sensitive: false }

end
