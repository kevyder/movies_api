# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  year        :date
#  genre       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Movie < ApplicationRecord
  # User relationship
  belongs_to :user

  validates :title, presence: true
  validates :year, presence: true
  validates :genre, presence: true
end
