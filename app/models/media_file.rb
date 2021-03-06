# frozen_string_literal: true

# == Schema Information
#
# Table name: media_files
#
#  id           :bigint           not null, primary key
#  gallery_id   :integer
#  default      :boolean
#  author       :string
#  file_type    :string
#  file         :string
#  for_logged   :boolean
#  visible      :boolean          default(TRUE)
#  visible_from :datetime
#  visible_to   :datetime
#  url          :string
#  url_target   :string
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class MediaFile < ApplicationRecord
end
