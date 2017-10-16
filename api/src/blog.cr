require "raze"

class AuthHandler < Raze::Handler
  def call(ctx, done)
    puts "yep this is the auth middleware"
    done.call
  end
end

get "/api/v1" do |ctx|
  "YEAH BOYYYYYY!"
end

get "/api/v1/posts" do |ctx|
  ctx.response.content_type = "application/json"

  [{
    "id" => 0, 
    "content" => "lol memes from id 0"
  }, {
    "id" => 1,
    "content" => "wow haha check out this content! post: 1"
  }].to_json
end

post "/api/v1/posts", AuthHandler.new do |ctx|
  # ya lol do some shit here
end

put "/api/v1/posts/:post_id", AuthHandler.new do |ctx|
  # edit this post XD!
end

delete "/api/v1/posts/:post_id", AuthHandler.new do |ctx|
  # hey delete this post please!!
end

Raze.run

