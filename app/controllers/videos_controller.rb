class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to @video, notice: "The vide #{@video.title} was created"
    else
      render "new"
    end
  end

  def show
    @video = Video.find(params[:id])
    @extention = "mp4" if @video.attachment_url.end_with? ".mp4"
    @extention = "ogg" if @video.attachment_url.end_with? ".ogg"
    @extention = "webm" if @video.attachment_url.end_with? ".webm"
  end

  def update
    @video = Video.find(params[:id])
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path, notice: "The video #{@video.title} was successfully deleted"
  end
  private
  def video_params
    params.require(:video).permit(:title, :attachment, :description)
  end
end
