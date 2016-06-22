require "sinatra"

get /video/* do |path|
    "Hello #{path}"
end
