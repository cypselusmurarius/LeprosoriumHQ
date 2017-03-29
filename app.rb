#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'sinatra/activerecord'

set :database, "sqlite3:leprosorium.db"

class Post < ActiveRecord::Base
	validates :username, presence: true, length: { minimum:3 }
	validates :message, presence: true, length: { minimun:3 }
end

class Comment < ActiveRecord::Base
	validates :username, presence: true, length: { minimum:3 }
end

get '/' do
	erb :index
end

# creating Posts

get '/new' do
	@p = Post.new
	erb :new
end

# creating Posts

post '/new' do

	@p = Client.new params[:client]
	if @p.save
		erb "<h2>Вы успешно отправили ваше сообщение!</h2>"
	else
		@error = @c.errors.full_messages.first
		erb :new
	end

	redirect to '/'
end


# commentaries

get '/details/:post_id' do

	# получаем переменную из url`а
	post_id = params[:post_id]

	# получаем список постов
	# (у нас будет только один пост)


	# выбираем этот один пост в переменную @row
	@row = results[0]

	# выбираем комментарии для нашего поста


	# возвращаем представление details.erb
	erb :details
end

# обработчик post-запроса /details/...
# (браузер отправляет данные на сервер, мы их принимаем)

post '/details/:post_id' do

	# получаем переменную из url`а
	post_id = params[:post_id]

	# получаем переменную из post-запроса
	content = params[:content]

	if content.length <= 0
		@error = 'Type comment text'
		return redirect to ('/details/'+ post_id)
	end

	#сохранение данных в БД


	redirect to ('/details/'+ post_id)
end
