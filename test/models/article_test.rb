# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  code         :string
#  author       :string
#  news         :boolean
#  archived     :boolean
#  image        :string
#  for_logged   :boolean
#  visible      :boolean          default(TRUE)
#  visible_from :datetime
#  visible_to   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
