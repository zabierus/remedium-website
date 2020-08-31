# frozen_string_literal: true

# == Schema Information
#
# Table name: categories_uploads
#
#  id          :bigint           not null, primary key
#  category_id :integer          not null
#  upload_id   :integer          not null
#
class CategoriesUpload < ApplicationRecord
end
