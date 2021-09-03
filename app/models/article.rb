class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 10, maximun: 100}
    validates :content, presence: true
    validates :slug, presence: true, uniqueness: true

    scope :recent, -> { order(created_at: :desc) }
end
