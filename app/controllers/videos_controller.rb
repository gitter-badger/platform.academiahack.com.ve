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

    #Si existe un dia academico para el video ir a el
    @academic_day = AcademicDay.get_academic_day day
    if @academic_day
      redirect_to academic_day_path(@academic_day), notice: message
    else
      redirect_to weeks_path, notice: message
    end
  end

  def update
    video = Video.find params[:id]
    if video.update(video_params)
      message = "Video actualizado exitosamente"
    else
      message = "Error al actualizar el video"
    end

    #Si existe un dia academico para el video ir a el
    @academic_day = AcademicDay.get_academic_day video.day
    if @academic_day
      redirect_to academic_day_path(@academic_day), notice: message
    else
      redirect_to weeks_path, notice: message
    end
  end

  def destroy
    video = Video.find params[:id]
    if video.destroy
      message = "Video eliminado exitosamente"
    else
      message = "Error al eliminar el video"
    end

    @academic_day = AcademicDay.get_academic_day video.day
    if @academic_day
      redirect_to academic_day_path(@academic_day), notice: message
    else
      redirect_to weeks_path, notice: message
    end
  end

  private
  def video_params
    params.require(:video).permit(:name, :url, :day_id)
  end
end
