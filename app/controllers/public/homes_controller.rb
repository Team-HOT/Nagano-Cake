class Public::HomesController < ApplicationController
    def top
    	#viewで使うとき
    	@address =Delivery.find(params[:history][:name1]).delivery_address
    	@name1 =Delivery.find(params[:history][:name1]).delivery_name1

        #createで使うとき
        @history = History.new(historyies_params)
        @history.delivery_name1 = Delivery.find(params[:history][:name1]).delivery_name1
        @history.delivery_address = Delivery.find(params[:history][:name1]).delivery_address
        @history.save

        #ユーザの履歴を取得
        History.find_by(user_id: params[:id])
        History.find_by(user_id: 1)
        History.all
    end
    def thanks
    end
end
