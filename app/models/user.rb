# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class User < ApplicationRecord
  has_secure_password
  # Creation Callback
  before_create :generate_token

  validates :name, presence: true
  # Email validations
  validates :email,
            presence: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            },
            uniqueness: {
              message: 'User already exists'
            }

  # Password Validations
  validates_confirmation_of :password
  validates_presence_of :password_confirmation, if: -> { !password.nil? }

  private

  # User token generation.
  def generate_token
    self.token = loop do
      token = SecureRandom.hex
      break token unless User.exists?(token: token)
    end
  end
end
