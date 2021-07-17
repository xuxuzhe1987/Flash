class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :user_decks, dependent: :destroy
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
  #include PgSearch::Model
    #pg_search_scope :search,
      #against: [ :name ],
      #using: { search: { prefix: true } } 
end
