class NoteTag < ApplicationRecord
   belongs_to :note
   belongs_to :tag

   # accepts_nested_attributes_for :tag
end
