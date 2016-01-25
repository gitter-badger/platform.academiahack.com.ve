def create_promo number, git_url, git_group, start_date, name=nil
  promo = Promo.new
  promo.number = number
  promo.git_url = git_url
  promo.git_group = git_group
  promo.start_date = start_date
  promo.name = name
  promo.save
  promo
end

create_promo 4, "gitlab.com/HackPromo4", "HackPromo4", Date.new(2015, 10, 19), "Promo 4"