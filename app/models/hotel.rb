class Hotel < ApplicationRecord
  validates_presence_of :name, :price, :memo, :address_city, :address_street, :image, :tel
  validates_length_of :name, :address_city, :address_street, :tel, maximum: 50
  validates_length_of :memo, maximum: 500
  
  #宿画像アップロード先の変更
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :reservations
  
  #検索用
  def self.search(search)
    return Hotel.all unless search
    Hotel.where(['name LIKE ?', "%#{search}%"]).or(where(['prefectures_name LIKE ?', "%#{search}%"])).or(Hotel.where(['address_city LIKE ?', "%#{search}%"]))
  end
  #userが予約したhotelの取得
  def reserved_by?(user)
    reservations.where(user_id: user.id).exists?
  end
  
end
