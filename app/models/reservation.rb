class Reservation < ApplicationRecord
  validates_presence_of :many_night, :many_people, :when_to, :check_in
  #==========個別にvalidate=============
  # many_night, min: 1, max: 30
  # many_people, min: 1, max: 6
  #=====================================
  
  #=========    確認画面作成のためのvalidate    ================
  validates_acceptance_of :confirming, allow_nil: false, on: [:create] #確認画面表示のため、一度めのcreateアクションのsaveを防ぐ役
  after_validation :check_confirming #validateを通った後にcheck_confirmingを通す
  #=============================================================
  
  
  #一度めのnewアクションを確認画面へ飛ばすためのパラメータ設定
  def check_confirming
   errors.delete(:confirming)
   self.confirming = errors.empty? ? '1' : ''
  end

  belongs_to :user
  belongs_to :hotel
end
