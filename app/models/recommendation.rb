# == Schema Information
#
# Table name: recommendations
#
#  id          :integer          not null, primary key
#  lower_bound :integer
#  upper_bound :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  clothes_id  :integer
#  user_id     :integer
#
class Recommendation < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:clothes, { :required => false, :class_name => "Clothe", :foreign_key => "clothes_id" })
end
