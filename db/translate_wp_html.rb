require 'open-uri'

Post.find(166).destroy
arr = []
Post.post.publish.each do |post|
  puts "== #{post.id} #{post.title} =="
  doc = Nokogiri::HTML(open("http://taichung-fieldwork.org/#{post.id}/#{CGI::escape post.handle}"))
  content = doc.at_css("div.entry-content").to_html
  st = content.index('<p')
  et = content.index('<div class="saboxplugin-wrap') ? content.index('<div class="saboxplugin-wrap') - 1 :
    content.index('<!-- Sim') ? content.index('<!-- Sim') - 1 : content.length
  post.content = content[st..et]
  post.save

  doc = Nokogiri::HTML post.content
  doc.search("img").each do |image|
    file_name = CGI::unescape image.attr("src").split("/").last
    folder = "/var/www/taichung-fieldwork/wp-content/uploads/"
    if File.exist?(folder + file_name)
      ck = Ckeditor::Picture.new
      ck.data = File.open("#{folder}/#{file_name}")
      ck.save
      image.attributes["src"].value = ck.url
    else
      arr << image.attr("src")
    end
  end
  post.content = doc.to_html
  post.content = post.content.gsub(/<div id="attachment_.*>/, "<div>")
  post.save
end
puts arr
