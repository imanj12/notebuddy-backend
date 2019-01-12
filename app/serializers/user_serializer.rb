class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :notes, :tags
  has_many :notes
  has_many :tags
end
