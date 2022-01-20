class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :delete_all
end
