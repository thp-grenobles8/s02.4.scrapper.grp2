require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_deputy_email(deputy_url)
  page = Nokogiri::HTML(open(deputy_url))
  email = page.xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text
end

def get_deputy_urls
  deputy_url = []
  deputy_email = []
  deputy_name = []
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
  page.css("tbody @href").each do |node|
    deputy_url << node.text
  end
  page.xpath("//td[1]").each do |node|
    deputy_name << node.text
  end
  deputy_name.map! {  |x| x.gsub!(/\n/,"") && x.gsub!(/\t/,"") } 
  deputy_url.map! { |x| x = "http://www2.assemblee-nationale.fr" + x } 
  deputy_url.each do |url|
    deputy_email << get_deputy_email(url)
    print "hello"
  end
  deputy_name_and_email = deputy_name.zip(deputy_email).to_h
end

