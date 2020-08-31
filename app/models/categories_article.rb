# frozen_string_literal: true

# == Schema Information
#
# Table name: categories_articles
#
#  id          :bigint           not null, primary key
#  category_id :integer          not null
#  article_id  :integer          not null
#
class CategoriesArticle < ApplicationRecord
end
