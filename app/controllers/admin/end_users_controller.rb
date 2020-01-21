class Admin::EndUsersController < ApplicationController
  def index
  	@end_user = EndUser.with_deleted
  end

  def show
  	@end_user = EndUser.with_deleted.find(params[:id])
  end

  def edit
  	@end_user = EndUser.with_deleted.find(params[:id])
  end

  def update
  	@end_user = EndUser.with_deleted.find(params[:id])
  	@end_user.update(end_user_params)
  	case params[:num]
  	when "0"
  		@end_user.restore
  		redirect_to admin_end_user_path(@end_user)
    when "1"
    	@end_user.destroy
    	redirect_to admin_end_user_path(@end_user)
    else render :edit
    end
  end

  def destroy
  end

private
  def end_user_params
 	params.require(:end_user).permit(:email, :name1, :name2, :name3, :name4, :address, :post, :number, :withdraw, :deleted_at, :num)
  end
end
