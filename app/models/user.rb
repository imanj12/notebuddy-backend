class User < ApplicationRecord
   #attributes: username, password, password_confirmation
   
   has_secure_password

   has_many :notes
   has_many :tags

   validates :username, presence: true
   validates :username, format: {with: URI::MailTo::EMAIL_REGEXP, message: 'must be correctly formatted e-mail address (e.g. jdoe@gmail.com)'}, allow_blank: true
   validates :username, uniqueness: true, allow_blank: true
   
   validates :password, length: {minimum: 6}, allow_blank: true

end
