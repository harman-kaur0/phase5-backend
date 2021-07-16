class Employee < ApplicationRecord
    has_secure_password

    validates :email, :username, uniqueness: {case_sensitive: false}
    validates :name, :password, :email, :username, :role, presence: true
    validates :username, :email, uniqueness: true
    validates :password, length: {minimum: 8}
    validate :valid_email?
    
    has_many :appointments
    has_many :patients, through: :appointments

    def valid_email?
        if !email.include?("@")
            errors.add(:email, "should include @ symbol")
        end
    end


end
