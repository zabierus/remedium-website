# frozen_string_literal: true

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
class EmailTemplate < ApplicationRecord
end
