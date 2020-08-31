# == Schema Information
#
# Table name: queued_emails
#
#  id                  :bigint           not null, primary key
#  email_to            :string
#  email_from          :string
#  email_template_code :string
#  subject             :string
#  body                :text
#  cc_list             :string
#  bcc_list            :string
#  status              :integer
#  message             :text
#  user_id             :integer
#  mailer_setup        :text
#  variables           :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'test_helper'

class QueuedEmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
