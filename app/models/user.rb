# frozen_string_literal: true

class User < ActiveRecord::Base
  include ActiveModel::Serialization
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # config/routes.rb
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :properties, dependent: :destroy
  has_many :favourite_properties, dependent: :destroy
  has_many :fav_properties, through: :favourite_properties, source: :property

  def admin?
    false
  end

  def user?
    true
  end
end

