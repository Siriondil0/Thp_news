class Link < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
end
