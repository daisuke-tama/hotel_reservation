class User < ApplicationRecord
  before_save { self.email = email.downcase } #DBに登録する前にemailを全て小文字にする
  validates_presence_of :name, :ruby, :tel, :address_city, :address_street #無記入防止
  validates_length_of :name, :ruby, :tel, :address_city, :address_street, maximum: 50 #いたずらに長い入力防止
  validates_length_of :introduction, maximum: 300 #自己紹介の最大文字数を300文字に
  VALID_EMAIL_ERGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {format: { with: VALID_EMAIL_ERGEX, message: "には@を含めた有効なアドレスを入力してください" }, uniqueness: { case_sensitive: false}} #emailに@がなくてはならない+エラーメッセージの変更。一意性の検証
  validates :password, length: {in: 6..20}, on: :create #createアクション時のみpasswordの長さを6文字から20文字以内に指定
  validates_confirmation_of :password #パスワード入力が2回とも同じ内容かを判別

  #プロフィール画像アップロード先の変更
  mount_uploader :icon, ImageUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         
  has_many :hotels
  has_many :reservations
  has_many :reserve_hotels, through: :reservations, source: :hotel
  
end
