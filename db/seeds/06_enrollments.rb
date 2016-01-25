students = User.all
current_promo = Promo.current
prope_htd = Product.find_by code:'002'
htd = Product.find_by code:'001'

def create_enrollment promo, product, user
  enrollment = Enrollment.new
  enrollment.promo = promo
  enrollment.product = product
  enrollment.user = user
  enrollment.save
  enrollment
end

students.each do |student|
  create_enrollment current_promo, prope_htd, student
  create_enrollment current_promo, htd, student
end
