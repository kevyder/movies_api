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

class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :token, :created_at, :updated_at
end
