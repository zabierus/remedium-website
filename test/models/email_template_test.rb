# == Schema Information
#
# Table name: email_templates
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  send       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class EmailTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
