# Author : Rolando Medrano

class SessionNote < ApplicationRecord
  belongs_to :session
  default_scope -> { order(created_at: :desc) }
  validates :session_id, presence: true
  validates :note, presence: true

# Searches for any matching param in the note
  def self.search(search)
    if search
      where('note LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end
end