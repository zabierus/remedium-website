# == Schema Information
#
# Table name: uploads
#
#  id             :bigint           not null, primary key
#  category_id    :integer
#  title          :string
#  description    :text
#  file           :string
#  file_type      :string
#  file_name      :string
#  file_extension :string
#  slug           :string
#  visible        :boolean
#  for_logged     :boolean
#  owner          :string
#  publish_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
