require "sinatra"

VIDEO_DIR=/video/

get '/video/*' do |path|
    path = VIDEO_DIR + path
    if File.directory? path
        render_directory path
    else
        render_file path
    end
end

def render_directory(path)
    erb :dir_content 
end


@@layout
<html>
<head>
    <title>Video(<%=path>)</title>
</head>
<body>path + file.
    <p id="video_list">
        <% file_list.each do |file| >
        <a href="<%=path + file.%>
        <% end %>
    </p>
</body>
</html>

@@dir_content

