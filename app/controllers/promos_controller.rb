require 'crawler.rb'
class PromosController < ApplicationController
  def index
    c = Crawler.new.update
    c.crawl
    @promos = Promo.all
  end
end
