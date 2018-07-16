require 'crawler.rb'
class PromosController < ApplicationController
  def index
    c = Crawler.new
    c.crawl
    @promos = Promo.all
  end
end
