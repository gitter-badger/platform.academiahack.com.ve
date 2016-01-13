class VideosController < ApplicationController
  def create
    day = Day.find params[:day_id]
    video = Video.new(video_params)
    video.day = day
    if video.save
      message = "Video creado"
    else
      message = "Error al crear el video"
    end

    redirect_to day_path(day), notice: message
  end

  def update
    video = Video.find params[:id]
    if video.update(video_params)
      message = "Video actualizado"
    else
      message = "Error al actualizar el video"
    end

    redirect_to day_path(video.day), notice: message
  end

  private
  def video_params
    params.require(:video).permit(:name, :url, :day_id)
  end
end
