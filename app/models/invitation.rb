class Invitation < ApplicationRecord
  include AASM

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, format: Devise.email_regexp, allow_blank: true
  validates :phone_number, phone: { possible: true, allow_blank: true, types: :mobile }

  aasm do
    state :pending, initial: true
    state :accepted, :rejected

    event :accept do
      transitions from: :pending, to: :accepted
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end
end
