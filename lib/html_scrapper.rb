require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
puts page.class   # => Nokogiri::HTML::Document
puts page.css("title")[0].name   # => title
puts page.css("title")[0].text   # => My webpage


crypto_key = []
crypto_value = []
page.xpath('//tr[*]/td[3]').each do |node|
    crypto_key << node.text
end

page.xpath('//tr[*]/td[5]').each do |node|
    crypto_value << node.text

end

crypto_value.map! { |x| x.gsub!(/\n/,"")}

print final = crypto_key.zip(crypto_value).to_h

print final.length
# /html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[1]/td[*]/a
# /html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[1]/td[2]
