require "sinatra"

get '/' do
	"Hello World"	
end

post '/submitted' do 
    "Thank you for submittinig your form."
end
