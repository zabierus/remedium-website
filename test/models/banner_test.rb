# == Schema Information
#
# Table name: banners
#
#  id                 :bigint           not null, primary key
#  code               :string
#  banner_items_count :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'test_helper'

class BannerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
