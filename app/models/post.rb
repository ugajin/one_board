class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  validates :user_id,
    presence: true,
    numericality: {only_integer: true, allow_blank: true}
  validates :content,
    length: {maximum: 255, allow_blank: true}
  validates :content_or_image, presence: true

  private
    def content_or_image
      content.presence or image.presence
    end

end
