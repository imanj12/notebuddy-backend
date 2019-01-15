class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :created_at, :updated_at
  has_many :notes
  has_many :tags

end
