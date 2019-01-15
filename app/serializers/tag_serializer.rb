class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :created_at, :updated_at

  def notes
    object.notes
  end

end
