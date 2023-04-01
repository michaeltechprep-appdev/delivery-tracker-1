# == Schema Information
#
# Table name: packages
#
#  id          :integer          not null, primary key
#  arrival     :date
#  description :string
#  details     :text
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Package < ApplicationRecord
end
