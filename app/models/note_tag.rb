class NoteTag < ApplicationRecord
   belongs_to :note
   belongs_to :tag

   validates_uniqueness_of :tag_id, :scope => :note_id
   validates_uniqueness_of :note_id, :scope => :tag_id

   # destroy a tag if it has no note_tags
   before_destroy :find_parent_tag
   after_destroy :destroy_childless_parent_tag

   def find_parent_tag
      @parent_tag = self.tag 
   end

   def destroy_childless_parent_tag
      if @parent_tag.note_tags.length == 0
         @parent_tag.destroy
      end
   end

end
