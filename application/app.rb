require "sinatra"

VIDEO_DIR="/var/www/html/stream/"
VIDEO_URL="/stream/"

get '/video/*' do |path|
    path.gsub!(/\/$/, "")
    abs_path = VIDEO_DIR + path
    if File.directory? abs_path
        render_directory path
    else
        render_file path
    end
end

def render_directory(path)
    if path == ""
        path = "."
    end
    file_list = Dir.new(VIDEO_DIR + path).map { |f| f }
    file_list.sort!.reject! { |f| f == "." or f == ".." }
    erb :dir_content, :locals => { :path => path, :file_list => file_list }
end

def render_file(path)
    erb :file_content, :locals => { :path => path }
end

__END__

@@ layout
<html>
<head>
    <title>Video(<%= path %>)</title>
</head>
<body>
<%= yield %>
</body>
</html>

@@ dir_content
    <p><a href="/video/<%= path.gsub(/[^\/][^\/]+$/, "") %>">Back</a></p>
    <p id="video_list">
        <% file_list.each do |file| %>
        <a href="/video/<%=path + "/" + file%>"><%=file%></a><br/>
        <% end %>
    </p>

@@ file_content
    <p><a href="/video/<%= path.gsub(/(^|\/)[^\/]+$/, "") %>">Back</a></p>
    <p id="video_play">
        <video src="<%=VIDEO_URL%><%=path%>" autoplay controls/>
    </p>


