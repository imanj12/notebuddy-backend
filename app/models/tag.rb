class Tag < ApplicationRecord
   # attributes: name, user_id

   belongs_to :user
   has_many :note_tags, dependent: :destroy
   has_many :notes, through: :note_tags

   validates :name, presence: true
   validates_uniqueness_of :name, :scope => :user_id

   # runs every time a note is saved or destroyed, destroying any tags without notes
   def self.destroy_noteless_tags
      self.all.each do |tag|
         if tag.note_tags.length == 0
            tag.destroy
         end
      end
   end

end
