class HomeController < ApplicationController
  def index
  end
  def create
    @weibo = Weibo.create(weibo:params[:content].gsub("\n","<br>"))
    render :text=>"#{@weibo.image.url}"
  end
end
