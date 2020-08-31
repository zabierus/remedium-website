# == Schema Information
#
# Table name: site_settings
#
#  id                       :bigint           not null, primary key
#  domain_address           :string
#  aliases                  :string
#  ga_tracking_id           :string
#  logo                     :string
#  favicon                  :string
#  owner_name               :string
#  company_name             :string
#  opening_hours            :string
#  contact_fax              :string
#  contact_phone            :string
#  contact_skype            :string
#  contact_facebook         :string
#  contact_www              :string
#  contact_email            :string
#  smtp_domain              :string
#  smtp_address             :string
#  smtp_user_name           :string
#  smtp_password            :string
#  smtp_port                :string
#  smtp_starttls_auto       :boolean
#  smtp_ssl                 :boolean
#  smtp_tls                 :boolean
#  smtp_authentication_type :integer          default(0)
#  smtp_from                :string
#  smtp_cc_list             :string
#  smtp_bcc_list            :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require 'test_helper'

class SiteSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
