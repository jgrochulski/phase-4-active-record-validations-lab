class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :is_clickbait, on: :create
  
  def is_clickbait
    if !(/top [0-9]|secret|won't believe|guess/i =~ self.title)
      errors.add(:title, "must contain clickbait")
    end
  end

end
