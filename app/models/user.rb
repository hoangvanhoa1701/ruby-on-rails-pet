# email:string
# password_digest:string
#
# password: string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password

    validates :email, 
        presence: true, 
        format: { with: URI::MailTo::EMAIL_REGEXP, 
        message: 'must be a valid email address' }, 
        uniqueness: { message: "has already been taken" }

    has_many :friends
    has_many :articles

    enum role: { admin: 0, user: 1 }
end
