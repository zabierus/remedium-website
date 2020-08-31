# frozen_string_literal: true

# == Schema Information
#
# Table name: email_template_keywords
#
#  id                :bigint           not null, primary key
#  keyword_id        :integer
#  email_template_id :integer
#
class EmailTemplateKeyword < ApplicationRecord
end
