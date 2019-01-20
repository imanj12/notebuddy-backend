class NoteTag < ApplicationRecord
   belongs_to :note
   belongs_to :tag

   validates_uniqueness_of :tag_id, :scope => :note_id
   validates_uniqueness_of :note_id, :scope => :tag_id

end
