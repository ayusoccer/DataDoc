# The Patient class.
class Patient < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :billingstatements, dependent: :destroy
  has_many :patients_treatments, dependent: :destroy
  has_many :treatments, through: :patients_treatments
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :email_chk, :fst_name, :lst_name

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def email_chk
    return unless email && (!email.include?('@') || !email.include?('.'))
    errors.add(:email, "must have an '@' and a '.'")
  end

  def fst_name
    return unless first_name && (first_name != first_name.capitalize)
    errors.add(:first_name, 'must be capitalized')
  end

  def lst_name
    return unless last_name && (last_name != last_name.capitalize)
    errors.add(:last_name, 'must be capitalized')
  end
end
