# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates(:email, { :presence => true , :uniqueness => {:case_sensitive => false}})
  validates(:password, { :presence => true})
  validates(:first_name, { :presence => true })
  validates(:last_name, {:presence => true})


end
