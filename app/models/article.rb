# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  code         :string
#  author       :string
#  news         :boolean
#  archived     :boolean
#  image        :string
#  for_logged   :boolean
#  visible      :boolean          default(TRUE)
#  visible_from :datetime
#  visible_to   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Article < ApplicationRecord
  include Visible

  translates :body, :in_site_map, :meta_description, :meta_tags, :meta_title, :name, :slug

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  is_impressionable counter_cache: true, column_name: :views_count, unique: true

  mount_uploader :image, ArticleImageUploader

  scope :visible, -> { where(archived: false, visible: true) }
  scope :news, -> { where(archived: false, visible: true, news: true) }

  validates_presence_of :name
  validate :visible_from_and_visible_to

  def tags
    meta_tags&.split(",") || []
  end

  def move_to_archive!
    update(archived: true)
  end

  def should_generate_new_friendly_id?
    new_record? || name_changed?
  end

  def destroy
    menu = MenuItem.find_by(article_id: id)
    menu&.destroy!
    super
  end
end
