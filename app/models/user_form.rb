# frozen_string_literal: true

# == Schema Information
#
# Table name: user_forms
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  form_id    :integer          not null
#  article_id :integer
#  body       :text
#  visible    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserForm < ApplicationRecord
end
