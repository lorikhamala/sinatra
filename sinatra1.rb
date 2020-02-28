require "sinatra"
enable :sessions

get '/getdoc' do
	"<!DOCTYPE html>
	<html> <body>
	<h1 style=color:red>This is a test in Sinatra.</h1>
</body>	</html>"
end 
	
post '/submitted' do
	if params[:username]=="bob" and params[:password]=="pass"
    	"Welcome, Bob! Thanks for logging in."
	else
    	"Username or Password Failure"
	end
end 

post '/hello' do
 session[:stored_message] = params[:name]
 "Saved the name"
end 

get '/greet' do
 "Greetings #{session[:stored_message]}!"
end 


# get '/candlestore' do
# 	@num = params[:candlenum]
# 	erb :howmany
# end 

get '/howmany' do
	erb :howmany
end 
	
post '/candles' do
  @x = params[:candlenum].to_i
  @y = params[:num2].to_i
  @z = params[:num3].to_i
  erb :candles
end



	# x = params[:candlenum]
	# x.times do
	# 	get'/candles' do
	# 	erb :candles
	# 	end
	# end 

# In my candles.erb file:

# <!DOCTYPE html>
# <html> <head> </head> <body>

# <img src="https://cdn3.volusion.com/nrtht.vrgud/v/vspfiles/photos/10010-2.jpg">

# </body>
# </html>





# require 'sinatra'   
# enable :sessions
#     get '/' do    
#          "Hello World”
#     end

# post “/submitted” do
# session[:stored _message] = params[:message]
# “Got here and message is #{params[:message]}”
# end

# get “/message_value” do
# “Got here and stored message is #{session[:stored_messsage]}” 
# end



# Sinatra Exercise 2. 
# What I need to do:
# if value of username in logon.html == bob AND value of password == pass
# post '/submitted' do 
#"Success!"

#else 
# post '/submitted' do
# "Failure"

#end


#Sinatra Exercise 3.
