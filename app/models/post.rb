class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 } 
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_clickbait?

    Clickbait_array = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i ]

    def title_is_clickbait?
        if Clickbait_array.none? { |pat| pat.match title } 
        errors.add(:title, "Must be Clickbait")
        end
    end

end
