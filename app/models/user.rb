# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  status                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: { inactive: 0, active: 1, deleted: 2 }

  mount_uploader :avatar, AvatarUploader

  attr_accessor :terms_of_service
  validates :terms_of_service, acceptance: true
  validates :email, presence: true

  validates_presence_of :password, if: -> { password_required? }
  validates_confirmation_of :password, if: -> { password_required? }
  validates_length_of :password, within: 8..128, allow_blank: true

  def confirm
    update(confirmed_at: DateTime.now, status: :active)
  end
end
