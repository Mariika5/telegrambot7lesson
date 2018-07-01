require 'telegram/bot'

TOKEN = '573052450:AAHdRpHBqXKh_qCewbQ7CfVmW71sxi3ADIA'

ANSWERS = [
	'У меня все хорошо',
	'Да',
	'Нет',
	'Может быть',
	'Попробуй',
	'Да, конечно',
	'Обязательно завтра прогуляй работу',
	'И когда тебя это останавливало?',
	'Позвони другу срочно'
]

def answer(message)
	if message.text == '/start'
		"Привет, #{message.from.first_name}! Я умею отвечать на следующие вопросы: На каком языке ты написан?, Кто твой автор?, Сколько времени?, Какой сегодня день недели?, Сколько времени будет через час? И на любые другие ваши вопросы я тоже умею отвечать."
	elsif message.text == 'На каком языке ты написан?'
		"Я написан на Ruby"	
	elsif message.text == 'Кто твой автор?'
		"Меня сговнокодила Мария и я доволен собой"	
    elsif message.text == 'Сколько времени?'
		date = Time.now
        date.strftime "%H:%M"
	elsif message.text == 'Какой сегодня день недели?'
		date = Time.now
			i = date.wday  
			if i == 0
			   "Сегодня воскресенье"
			elsif i == 1
			   "Вчера была среда сегодня понедельник"
			elsif i == 2
			   "Сегодня вторник"
			elsif i == 3
			   "Сегодня реда"
			elsif i == 4
			   "Четверг"
			elsif i == 5
			   "Пятница, долой работу"
			elsif i == 6
			   "Сегодня суббота! Все на шашлыки!"
			end
	elsif message.text == 'Сколько времени будет через час?'
		date = Time.now
        newtime = date + (60 * 60)
        "Через час будет #{newtime.strftime '%H:%M'} по UTC"
    else
		ANSWERS.sample	
	end
end


Telegram::Bot::Client.run(TOKEN) do |bot|
	bot.listen do |message|
		puts message
		bot.api.send_message(
          chat_id: message.chat.id,
          text: answer(message)
			)
	end
end



# "На каком языке ты написан?"
# "Кто твой автор?"
# "Сколько времени?"
# "Какой сегодня день недели?"
# "Сколько времени будет через час?"