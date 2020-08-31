# == Schema Information
#
# Table name: banner_items
#
#  id           :bigint           not null, primary key
#  banner_id    :integer          not null
#  file         :string
#  url          :string
#  url_target   :string
#  clicks_count :integer
#  position     :integer
#  for_logged   :boolean
#  visible      :boolean          default(TRUE)
#  visible_from :datetime
#  visible_to   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class BannerItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
