# == Schema Information
#
# Table name: keywords
#
#  id         :bigint           not null, primary key
#  key        :string
#  value      :string
#  url        :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class KeywordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
