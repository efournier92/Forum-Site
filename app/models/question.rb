class Question < ActiveRecord::Base

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :title, presence: true, uniqueness: true,
            length: { minimum: 40,  message: 'Title Must Have 40+ Characters!' }

  validates :description, presence: true,
            length: { minimum: 150, message: 'Description Must Have 150+ Characters!' }

end
