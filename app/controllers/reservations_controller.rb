class ReservationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @reservations = Reservation.where(user_id: "#{params[:id]}") #reservationをhotelにネストしてしまったのでuser_idでcurrent_userが予約した宿を選定する
      @hotels = Hotel.all #予約一覧で宿情報を表示するため
    end
    
    def new
      @reservation = Reservation.new
      @hotel = Hotel.find_by(id: params[:hotel_id])#hotelにネストされているためルーティングに@hotel.idが必要
    end
    
    #予約したuserに関連付け、選択したhotelも関連付け（なのでhotel.idを持つページからでないと移行できない)
    def create
      @reservation = Reservation.new(reservation_params)
      @reservation.user_id = current_user.id #誰が予約したのかの判断材料
      @reservation.hotel_id = params[:hotel_id] #どの宿を予約したのかの判断材料
      @hotel = Hotel.find_by(id: params[:hotel_id]) #再度new=>createへ移行するために用意するid
      #==========合計金額算出を算出し、@reservationに代入=======================
      array = [@reservation.many_night,@reservation.many_people,@hotel.price]
      @reservation.amount = array.inject(:*)
      #========================================================================
      if @reservation.save
        flash[:notice] = "予約が完了しました"
        redirect_to "/reservations/#{current_user.id}/index"
      else
        render :new
      end
    end
    
    def destroy
      reservation = Reservation.find_by(hotel_id: params[:hotel_id], user_id: current_user.id)
      reservation.destroy
      flash[:notice] = "予約をキャンセルしました"
      redirect_to "/reservations/#{current_user.id}/index"
    end
    
    def reservation_params
      params.require(:reservation).permit(:many_night, :many_people, :when_to, :check_in, :amount, :user_id, :hotel_id, :confirming)
    end
    
end
