class AcademicDaysController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    @academic_day = AcademicDaySchedule.find(params[:id])
    @academic_days = @academic_day.order_list

    if params[:video_id]
      @video = Video.find params[:video_id]
    else
      @video = Video.new
    end

    @tab = params[:tab] ? params[:tab] : "requirements"

    if @academic_days
      session[:academic_day_id] = params[:id]
    else
      redirect_to root_path, notice: 'El dia no se encuentra o esta bloqueado'
    end
  end

  def confirm_mentor
    academic_day = AcademicDaySchedule.find_by mentor_token: params[:token]
    academic_day.mentor_status = 'confirmed'
    if academic_day.save
      message = "Asistencia confirmada!"
    else
      message = "Error al confirmar la asistencia!"
    end
    redirect_to weeks_path(current_week: academic_day.academic_week_schedule.position), notice: message
  end

  def assign_mentor
    academic_day = AcademicDaySchedule.find params[:academic_day_id]
    mentor = Mentor.find params[:mentor_id]

    if academic_day.mentor
      #Ya existe un mentor asignado previamente! Notificarle que otro mentor fue asignado
      AcademicMailer.unconfirm_mentor(academic_day).deliver
    end

    academic_day.mentor = mentor
    academic_day.mentor_token = Digest::SHA1.hexdigest([Time.now, rand].join)
    academic_day.mentor_status = 'invited'
    if academic_day.save
      AcademicMailer.confirm_mentor(academic_day).deliver
      message = "Mentor asignado exitosamente!"
    else
      message = "Error al asignar el mentor!"
    end
    redirect_to weeks_path(current_week: academic_day.academic_week_schedule.position), notice: message
  end

  def toggle
    academic_day = AcademicDaySchedule.find(params[:id])
    academic_day.status = academic_day.active? ? :blocked : :active

    if academic_day.save
      message = "Status del dia academico actualizado exitosamente"
    else
      message = 'No se pudo actualizar el dia academico!'
    end

    redirect_to weeks_path(current_week: academic_day.academic_week_schedule.position), notice: message
  end

  def open_academic_week
    academic_week = AcademicWeekSchedule.find params[:id]
    academic_week.academic_day_schedules.each do |academic_day|
      academic_day.status = :active
      academic_day.save
    end
    redirect_to weeks_path(current_week: academic_week.position)
  end

  def close_academic_week
    academic_week = AcademicWeekSchedule.find params[:id]
    academic_week.academic_day_schedules.each do |academic_day|
      academic_day.status = :blocked
      academic_day.save
    end
    redirect_to weeks_path(current_week: academic_week.position)
  end
end
