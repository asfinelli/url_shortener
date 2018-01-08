class ShortenedUrlsController < ApplicationController
  def index
    @shortenedurls = ShortenedUrl.all
  end

  def show
    shortenedurl = ShortenedUrl.where(:random_id=>params[:id]).first

    if shortenedurl
      redirect_to shortenedurl.original
    else
      render "index"
    end
  end
  def new
    @shortenedurl = ShortenedUrl.new

    letters = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    @shortenedurl.random_id = (0...8).map{ letters[rand(letters.length)] }.join
  end

  def shortened_urls_params
    params.require(:shortened_url).permit(:original, :random_id)
  end

  def create
    @shortenedurl = ShortenedUrl.new(shortened_urls_params)

    if @shortenedurl.save
      redirect_to shortened_urls_path
    else
      render "new"
    end
  end

end
