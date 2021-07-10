class UserDeck < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
end
