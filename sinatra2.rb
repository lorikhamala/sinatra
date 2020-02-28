require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader'

if File.exists?("candlestore.db")
	File.delete("candlestore.db")
end 

db = SQLite3::Database.new("candlestore.db")

db.execute <<-SQL
	CREATE TABLE candlepurchases (
	id integer PRIMARY KEY,
	name VARCHAR,
	email VARCHAR,
	date DATE,
	virnum INTEGER,
	teanum INTEGER,
	pilnum INTEGER);
SQL

db.execute("INSERT INTO candlepurchases(name, email, date, virnum) values(?,?,?,?);",["Bob Smith", "bob@sample.com","2020-01-20", 5])
db.execute("INSERT INTO candlepurchases(name, email, date, virnum, teanum, pilnum) values(?,?,?,?,?,?);",["Maria Smith", "maria@sample.com","2020-01-20", 1, 2, 5])
db.execute("INSERT INTO candlepurchases(name, email, date, virnum) values(?,?,?,?);",["Juan Smith", "juan@sample.com","2020-01-20", 3])
db.execute("INSERT INTO candlepurchases(name, email, date, teanum) values(?,?,?,?);",["Sara Smith", "sara@sample.com","2020-01-20", 8])
db.execute("INSERT INTO candlepurchases(name, email, date, pilnum) values(?,?,?,?);",["Imani Smith", "imani@sample.com","2020-01-20", 1])


get '/' do
	@results = db.execute("SELECT * FROM candlepurchases;")
	erb :results
end 