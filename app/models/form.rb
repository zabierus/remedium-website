# frozen_string_literal: true

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
class Form < ApplicationRecord
end
