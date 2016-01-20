class AcademicMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def confirm_mentor(mentor_user, academic_day)
    @mentor_user = mentor_user
    @academic_day = academic_day

    title = Rails.env.development? ? '[DEV] ' : ''

    mail(to: @mentor_user.email, subject: "#{title}Hack | Mentor | Confirmacion de clase")
  end

  def unconfirm_mentor(mentor_user, academic_day)
    @mentor_user = mentor_user
    @academic_day = academic_day

    title = Rails.env.development? ? '[DEV] ' : ''

    mail(to: @mentor_user.email, subject: "#{title}Hack | Mentor | Clase replanificada")
  end
end
