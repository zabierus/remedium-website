# frozen_string_literal: true

# frozen_string_literal: true

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
class ContactRequest < ApplicationRecord
end
