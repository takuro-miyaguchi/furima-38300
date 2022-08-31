class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :sender
  belongs_to :period

  belongs_to :user
  # has_one :purchase_record
  has_one_attached :image

  validates :image,        presence: true
  validates :title,        presence: true
  validates :concept,      presence: true
  validates :category_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :charge_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :sender_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :period_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price,        presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
