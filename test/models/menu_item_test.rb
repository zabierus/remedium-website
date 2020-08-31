# == Schema Information
#
# Table name: menu_items
#
#  id               :bigint           not null, primary key
#  data_type        :integer          not null
#  code             :string
#  extra_attributes :string
#  fa_icon          :string
#  article_id       :integer
#  category_id      :integer
#  gallery_id       :integer
#  form_id          :integer
#  for_logged       :boolean
#  visible          :boolean          default(TRUE)
#  visible_from     :datetime
#  visible_to       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
