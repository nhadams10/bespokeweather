# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  zipcode         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_one(:thresholds, { :class_name => "Threshold", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:recommendations, { :class_name => "Recommendation", :foreign_key => "user_id", :dependent => :destroy })
end
