# == Schema Information
#
# Table name: clothes
#
#  id         :integer          not null, primary key
#  article    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Clothe < ApplicationRecord
  has_many(:recommendations, { :class_name => "Recommendation", :foreign_key => "clothes_id", :dependent => :destroy })
end
