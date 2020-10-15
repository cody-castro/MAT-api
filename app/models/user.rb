class User < ApplicationRecord
    has_many :reviews
    has_many :locations, through: :reviews
end
