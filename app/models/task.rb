class Task < ApplicationRecord
    validates :title, presence: :true
    validates :description, presence: :true

    belongs_to :board
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_one_attached :eyecatch

    def author_name
        user.display_name
    end

end
