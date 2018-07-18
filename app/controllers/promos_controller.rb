require 'crawler.rb'
class PromosController < ApplicationController
  def index
    c = Crawler.new
    c.crawl
    @promos = Promo.where(user: "webpage")
  end
end
