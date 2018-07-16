require 'open-uri'
require 'promo.rb'
class Crawler
  def crawl
    page =  Nokogiri::HTML(open("https://www.tokopedia.com/promo/"))
    title = page.css("div.promotion-description p")
    source = page.css("div.promotion-cta a")
    title.each_with_index do |val,index|
      if(!Promo.where(title: parse_title(title[index].text),  source: "tokopedia", link: source[index]["href"]).exists?)
        Promo.create(title: parse_title(title[index].text), source: "tokopedia", link: source[index]["href"])
      end
    end
  end

private
  def parse_title(str)
    str.tr("\n\t", "")
  end
end
