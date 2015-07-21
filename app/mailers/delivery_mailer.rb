class DeliveryMailer < ActionMailer::Base
  default from: "contacto@academiahack.com.ve"

  def notify_commit_selected user, delivery
    @user = user
    @delivery = delivery
    mail(to: 'mentores@academiahack.com.ve', subject: "Entrega de reto #{ @delivery.challenge.title}")
  end
end
