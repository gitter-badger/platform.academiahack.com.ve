class AcademicMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def confirm_mentor(academic_day)
    @academic_day = academic_day

    title = Rails.env.development? ? '[DEV] ' : ''
    mentor_email = Rails.env.development? ? 'rramos@academiahack.com.ve' : academic_day.mentor.user.email

    mail(to: mentor_email, subject: "#{title}Hack | Mentor | Confirmacion de clase")
  end

  def unconfirm_mentor(academic_day)
    @academic_day = academic_day

    title = Rails.env.development? ? '[DEV] ' : ''
    mentor_email = Rails.env.development? ? 'rramos@academiahack.com.ve' : academic_day.mentor.user.email

    mail(to: mentor_email, subject: "#{title}Hack | Mentor | Clase replanificada")
  end
end
