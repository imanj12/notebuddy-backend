class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tags, :created_at, :updated_at

  def tags
    object.tags
  end

end
