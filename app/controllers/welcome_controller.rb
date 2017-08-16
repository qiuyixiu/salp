class WelcomeController < ApplicationController
  def index
    @introductions = Introduction.order("updated_at DESC").page(params[:page]).per(5)                     #了解促进会
    @notices = Notice.order("updated_at DESC").page(params[:page]).per(9)                                 #广告
    @messages = Message.where(:is_hidden => false).order("updated_at DESC").page(params[:page]).per(5)    #本会动态
    @offers = Offer.where(:is_hidden => false).order("updated_at DESC").page(params[:page]).per(5)        #人才伯乐
    @exchanges = Exchange.order("updated_at DESC").page(params[:page]).per(5)                             #作品交流
    @educations = Education.order("updated_at DESC").page(params[:page]).per(5)                           #各地皮雕培训
    @lists = List.order("updated_at DESC").page(params[:page]).per(5)                                     #获奖作品
    @industries = Industry.order("updated_at DESC").page(params[:page]).per(5)                            #行业资讯
    @works = Work.order("updated_at DESC").page(params[:page]).per(5)                                     #参赛作品
    @games = Game.order("updated_at DESC").page(params[:page]).per(1)                                     #皮雕大赛
  end

end
