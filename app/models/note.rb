class Note < ApplicationRecord
   #attributes: title, content, user_id
   
   belongs_to :user
   has_many :note_tags, dependent: :destroy
   has_many :tags, through: :note_tags

   validates :title, presence: true

   accepts_nested_attributes_for :note_tags

   # destroy a tag if it has no notes (note_tags)
   around_save :auto_destroy_noteless_tags
   around_destroy :auto_destroy_noteless_tags

   private
   
      def auto_destroy_noteless_tags
         @user = self.user
         yield
         @user.tags.each do |tag|
            if tag.note_tags.length == 0
               tag.destroy
            end
         end
      end

end
