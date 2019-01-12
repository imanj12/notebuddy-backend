class Tag < ApplicationRecord
   belongs_to :user
   has_many :note_tags
   has_many :notes, through: :notes_tags

end
