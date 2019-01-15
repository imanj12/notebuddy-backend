class Note < ApplicationRecord
   belongs_to :user
   has_many :note_tags
   has_many :tags, through: :note_tags

   # accepts_nested_attributes_for :note_tags

end
