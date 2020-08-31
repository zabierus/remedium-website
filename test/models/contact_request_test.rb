# == Schema Information
#
# Table name: contact_requests
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  subject    :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ContactRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
