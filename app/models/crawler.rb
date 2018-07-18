require 'open-uri'
require 'promo.rb'
class Crawler
  def crawl(user= "webpage")
    page =  Nokogiri::HTML(open("https://www.tokopedia.com/promo/"))
    title = page.css("div.promotion-description p")
    source = page.css("div.promotion-cta a")
    title.each_with_index do |val,index|
      if(!Promo.where(title: parse_title(title[index].text),  source: "tokopedia", link: source[index]["href"], user: user).exists?)
        Promo.create(title: parse_title(title[index].text), source: "tokopedia", link: source[index]["href"], user: user)
      end
    end
  end

  def update(user= "webpage")
    @result = []
    page =  Nokogiri::HTML(open("https://www.tokopedia.com/promo/"))
    title = page.css("div.promotion-description p")
    source = page.css("div.promotion-cta a")
    title.each_with_index do |val,index|
      if(!Promo.where(title: parse_title(title[index].text),  source: "tokopedia", link: source[index]["href"], user: user).exists?)
        Promo.create(title: parse_title(title[index].text), source: "tokopedia", link: source[index]["href"], user: user, )
        promo_image = JSON.parse(page.css("div.promotion-image")[index].children[1]["data-click"])["ecommerce"]["promoClick"]["promotions"][0]["creative_url"]
        @result.push({user: user, title: parse_title(title[index].text), source: "tokopedia", link: source[index]["href"], promo_image: promo_image})
      end
    end
    @result
  end

private
  def parse_title(str)
    str.tr("\n\t", "")
  end
end
