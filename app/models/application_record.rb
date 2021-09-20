class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  #=============================郵便番号検索用=============================================
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  #========================================================================================
  
end
