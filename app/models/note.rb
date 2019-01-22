class Note < ApplicationRecord
   #attributes: title, content, user_id
   
   belongs_to :user
   has_many :note_tags, dependent: :destroy
   has_many :tags, through: :note_tags

   validates :title, presence: { message: 'Note must have a title'}

   accepts_nested_attributes_for :note_tags

   # destroy a tag if it has no notes (note_tags)
   after_save :destroy_noteless_tags
   after_destroy :destroy_noteless_tags

   private

      def destroy_noteless_tags
         Tag.destroy_noteless_tags()
      end

end
