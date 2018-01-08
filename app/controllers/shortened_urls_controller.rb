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
    @shortenedurl.random_id = (0...8).map{ letters[rand(letters.length)] }.jion
  end

  def shortenedurls_params
    params.require(:shortenedurl).permit(:original_url, :random_id)
  end

  def create
    @shortenedurl = ShortenedUrl.new(shortenedurls_params)

    if @shortenedurl.save
      redirect_to urls_path
    else
      render "new"
    end
  end

end
