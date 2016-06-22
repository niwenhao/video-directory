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
