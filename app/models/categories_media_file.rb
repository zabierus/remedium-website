# frozen_string_literal: true

# == Schema Information
#
# Table name: categories_media_files
#
#  id            :bigint           not null, primary key
#  category_id   :integer          not null
#  media_file_id :integer          not null
#
class CategoriesMediaFile < ApplicationRecord
end
