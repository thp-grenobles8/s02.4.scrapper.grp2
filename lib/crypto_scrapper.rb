require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
  crypto_key = []
  crypto_value = []

  page.xpath('//td[3]').each do |node|
    crypto_key << node.text
  end

  page.xpath('//td[5]').each do |node|
    crypto_value << node.text
  end

  crypto_value.map! { |x| x.gsub!(/\n/,"")[1..-1]}

  print final = crypto_key.zip(crypto_value).to_h

  return final
end
