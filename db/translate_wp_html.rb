require 'open-uri'

Post.find(166).destroy
Post.post.publish.each do |post|
  puts "== #{post.id} #{post.title} =="
  doc = Nokogiri::HTML(open("http://taichung-fieldwork.org/#{post.id}/#{CGI::escape post.handle}"))
  content = doc.at_css("div.entry-content").to_html
  st = content.index('<p')
  et = content.index('<!-- Sim') ? content.index('<!-- Sim') - 1 : content.length
  post.content = content[st..et]
  post.save

  arr = []
  doc = Nokogiri::HTML post.content
  doc.search("img").each do |image|
    file_name = image.attr("src").split("/").last
    folder = "/home/hank/workspace/tcfdg_wordpress/taichung-fieldwork/wp-content/uploads/"
    if File.exist?(folder + file_name)
      ck = Ckeditor::Picture.new
      ck.data = File.open("#{folder}/#{file_name}")
      ck.save
      image.attributes["src"].value = ck.url
    else
      puts "== #{folder}/#{file_name} not exist."
      arr << image.attr("src")
    end
  end
  post.content = doc.to_html
  post.content = post.content.gsub(/<div id="attachment_.*>/, "<div>")
  post.save
  puts arr
end
