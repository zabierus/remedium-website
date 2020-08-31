# == Schema Information
#
# Table name: forms
#
#  id         :bigint           not null, primary key
#  article_id :integer
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class FormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
