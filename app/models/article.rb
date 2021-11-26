class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    mount_uploader :image, ImageUploader

    # ALID_STATUSES = ['public', 'private', 'archived']

    # validates :status, inclusion: { in: VALID_STATUSES }

    # def archived?
    #     status == 'archived'
    # end
end
