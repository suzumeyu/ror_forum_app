class Relationship < ApplicationRecord
    belongs_to :followed_user, class_name: "User", foreign_key: :followed_id
    belongs_to :follower_user, class_name: "User", foreign_key: :follower_id

    validate :cannot_follow_self
    validates :follower_id, uniqueness: { scope: :followed_id, message: "You can follow user once at time" }

    private

    def cannot_follow_self
        if follower_id == followed_id
            # Adding error message for record (not collumn) - record won't be saved in database
            errors.add(:base, "You cannot follow yourself")
        end
    end
end