class Task < ApplicationRecord
    validates :title, presence: :true
    validates :description, presence: :true

    belongs_to :board
    belongs_to :user
    has_one_attached :eyecatch

end
