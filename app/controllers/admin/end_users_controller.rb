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
  	if @end_user.update(end_user_params)
  	redirect_to admin_end_user_path(@end_user)
    else
    render :edit
    end
  end

  def destroy
  	@end_user = EndUser.find(params[:id])
  	@end_user.destroy
  	redirect_to admin_end_user_path(@end_user)
  end

  def end_user_params
 	params.require(:end_user).permit(:email, :name1, :name2, :name3, :name4, :address, :post, :number, :withdraw, :deleted_at)
  end
end
