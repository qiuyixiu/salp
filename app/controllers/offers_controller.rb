class OffersController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :join, :quit]
    layout "account", only: [:new]
    impressionist

    def index
      @offers = Offer.where(:is_hidden => false).order("created_at DESC").page(params[:page]).per(20)
    end

    def new
      @offer = Offer.new
    end

    def create
      @offer = Offer.new(offer_params)
      @offer.user = current_user

      if @offer.save
        redirect_to account_offer_collections_path
        flash[:notice] = "已提交，待管理员审核后发布"
      else
        render :new
      end
    end

    def show
      @offer = Offer.find(params[:id])
      impressionist(@offer)
      @user = @offer.user

      if @offer.is_hidden
        flash[:warning] = "在审核中！不可看！"
        redirect_to root_path
      end
    end

    def join
      @offer = Offer.find(params[:id])
      if !current_user.is_member_of?(@offer)
        current_user.join_offer_collection!(@offer)
      end
      redirect_to offer_path(@offer)
    end

    def quit
      @offer = Offer.find(params[:id])
      if current_user.is_member_of?(@offer)
        current_user.quit_offer_collection!(@offer)
      end
      redirect_to offer_path(@offer)
    end

    private

    def offer_params
      params.require(:offer).permit(:title, :description, :image, :user_id)
    end

end
