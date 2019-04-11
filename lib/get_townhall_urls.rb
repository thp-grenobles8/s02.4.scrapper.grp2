require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open(townhall_url))
  email = page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text 
  return email
end


def get_townhall_urls
  townhall_url = []
  townhall_email = []
  townhall_name = []
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  page.css(".lientxt > @href").each do |node|
    townhall_url << node.text
  end
  page.css(".lientxt").each do |node|
    townhall_name << node.text
  end
  townhall_url.map! { |x| x = "http://annuaire-des-mairies.com" + x[1..-1] }
  townhall_url.each do |url|
    townhall_email << get_townhall_email(url)
  end
  townhall_name_and_email = townhall_name.zip(townhall_email).to_h
end
