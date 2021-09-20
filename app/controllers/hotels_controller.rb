  class HotelsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :ensure_user, only: [:edit, :update, :destroy]
    
    def index
      @hotels = Hotel.all
    end
    #キーワード検索
    def index_keyword_search
      @hotels = Hotel.search(params[:search])
      @search_word = params[:search]
    end
    #都道府県検索
    def index_prefectures_name_search
      hotels_index_prefectures_name_search
      @hotels = @prefecture_keyword
      @search_word = params[:prefecture_keyword]
    end
    
    
    def new
      @hotel = Hotel.new
    end
    
    def create
      @hotel = Hotel.new(hotel_params)
      @hotel.user_id = current_user.id #作成したhotelと作成者のidを紐付け
      if @hotel.save
        redirect_to hotels_path(current_user)
      else
        flash.now[:notice] = "必須項目が記入されていないか、条件をクリアしていません"
        render new_hotel_path
      end
    end
    
    def show
      @hotel = Hotel.find(params[:id])
    end
    
    def edit
    end
    
    def update
      if @hotel.update(hotel_params)
        flash[:notice] = "宿の情報を変更しました"
        redirect_to hotels_path
      else
        flash[:notice] = "もう一度確認の上記入してください"
        render :edit
      end
    end
    
    def destroy
      @hotel.destroy
      flash.now[:notice] = "宿の登録を削除しました"
      redirect_to hotels_path
    end
    
    
    private
    
    def ensure_user
      @hotel = Hotel.find_by(params[:id])
      unless @hotel.user_id == current_user.id
        redirect_to new_hotel_path
      end
    end
    
    def hotel_params
      params.require(:hotel).permit(:name, :tel, :price, :memo, :user_id, :postcode, :prefectures_name, :prefecture_code, :address_city, :address_street, :address_building, :image)
    end
    
    #===============都道府県検索用　名称変換欄=====================
    def hotels_index_prefectures_name_search
      if params[:prefecture_keyword] == '北海道地方'
        @prefecture_keyword = Hotel.where(prefectures_name: "北海道")
      elsif params[:prefecture_keyword] == '東北地方'
        @prefecture_keyword = Hotel.where(prefectures_name: ["青森県", "岩手県", "宮城県", "秋田県", "山形県" ,"福島県"])
      elsif params[:prefecture_keyword] == '関東地方'
        @prefecture_keyword = Hotel.where(prefectures_name: ["東京都", "茨城県", "栃木県", "群馬県", "埼玉県" ,"千葉県" ,"神奈川県"])
      elsif params[:prefecture_keyword] == '北陸・甲信越地方'
        @prefecture_keyword = Hotel.where(prefectures_name: ["新潟県", "富山県", "石川県", "福井県", "山梨県" ,"長野県"])
      elsif params[:prefecture_keyword] == '東海地方'
        @prefecture_keyword = Hotel.where(prefectures_name: ["愛知県", "岐阜県", "三重県", "静岡県"])
      elsif params[:prefecture_keyword] == '近畿地方'
        @prefecture_keyword = Hotel.where(prefectures_name: ["滋賀県", "京都府", "奈良県", "和歌山県", "大阪府" ,"兵庫県"])
      elsif params[:prefecture_keyword] == '中国地方'
        @prefecture_keyword = Hotel.where(prefectures_name: ["鳥取県", "島根県", "岡山県", "広島県", "山口県"])
      elsif params[:prefecture_keyword] == '四国地方'
        @prefecture_keyword = Hotel.where(prefectures_name: ["徳島県", "香川県", "愛媛県", "高知県"])
      elsif params[:prefecture_keyword] == '九州地方'
        @prefecture_keyword = Hotel.where(prefectures_name: ["福岡県", "佐賀県", "長崎県", "熊本県", "大分県" ,"宮崎県" ,"鹿児島県"])
      elsif params[:prefecture_keyword] == '沖縄'
        @prefecture_keyword = Hotel.where(prefectures_name: ["沖縄県"])        
      end
    end
    #===================================================================
  end
