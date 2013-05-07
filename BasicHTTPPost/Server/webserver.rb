#---
# Excerpted from "iOS Recipes",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
#---
require 'webrick'
include WEBrick

post_proc = proc do |req, resp| 
  resp['Content-Type'] = "text/html"
  resp.body = %{
    <html><body> 
    <h1>Thank you for POSTing!</h1>
    <p>
      You posted: #{req.query.inspect}
    </p>
    </body></html>
  }
end

upload_proc = proc do |req, resp|  
  filedata = req.query["filedata"]
  File.open(filedata.filename, "wb") do |f|
    filedata.each_data do |data|
      f << data
    end
  end
  
  resp['Content-Type'] = "text/html"
  resp.body = %{
    <html><body> 
    <h1>Thanks for the upload!</h1>
    <p>
      Your file was saved to #{filedata.filename}!
    </p>
    </body></html>
  }
end

post  = HTTPServlet::ProcHandler.new(post_proc)
upload = HTTPServlet::ProcHandler.new(upload_proc)

params = { :Port => 3000, :DocumentRoot => File.dirname(__FILE__) }

server = HTTPServer.new(params)

server.mount("/post",  post)
server.mount("/upload", upload)

trap("INT") { server.shutdown }

server.start