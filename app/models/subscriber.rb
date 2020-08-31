class Subscriber < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :list
  after_create :activate!

  def activate!
    update(active: true)
  end

  def deactivate!
    update(active: false)
  end

  def anonymize!
    update(name: "xxx", email: "xxx@xxx.xxx")
  end
end
