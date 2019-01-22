class Tag < ApplicationRecord
   # attributes: name, user_id

   belongs_to :user
   has_many :note_tags, dependent: :destroy
   has_many :notes, through: :note_tags

   validates :name, presence: true
   validates_uniqueness_of :name, :scope => :user_id

end
