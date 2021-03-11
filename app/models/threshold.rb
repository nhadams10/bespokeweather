# == Schema Information
#
# Table name: thresholds
#
#  id         :integer          not null, primary key
#  cold       :integer
#  coldest    :integer
#  moderate   :integer
#  warm       :integer
#  warmest    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Threshold < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

end
