class Note < ApplicationRecord
   belongs_to :user
   has_many :note_tags, dependent: :destroy
   has_many :tags, through: :note_tags

   accepts_nested_attributes_for :note_tags

   # destroy a tag if it has no note_tags
   after_save :destroy_noteless_tags

   private

      def destroy_noteless_tags
         Tag.destroy_noteless_tags()
      end

end
