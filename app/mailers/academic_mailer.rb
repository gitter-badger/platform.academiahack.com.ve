class AcademicMailer < ActionMailer::Base
  default from: 'contacto@academiahack.com.ve'

  def confirm_mentor(academic_day)
    @academic_day = academic_day
    mail(to: academic_day.mentor.user.email, subject: "Hack | Mentor | Confirmacion de clase")
  end

  def unconfirm_mentor(academic_day)
    @academic_day = academic_day
    mail(to: academic_day.mentor.user.email, subject: "Hack | Mentor | Clase replanificada")
  end
end
