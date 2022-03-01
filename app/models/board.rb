class Board < ApplicationRecord
    validates :title, presence: :true
    validates :description, presence: :true

    belongs_to :user

    def author_name
        user.display_name
    end
end
