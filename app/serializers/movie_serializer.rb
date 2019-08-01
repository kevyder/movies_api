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

class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :genre, :description
  attribute :year, &:year
  belongs_to :user
end
