require 'telegram/bot'

TOKEN = '573052450:AAHdRpHBqXKh_qCewbQ7CfVmW71sxi3ADIA'

ANSWERS = [
	'У меня все хорошо',
	'Да',
	'Нет',
	'Может быть',
	'Попробуй',
	'Да, конечно'
]

def answer(message)
	if message.text == '123'
		"Привет, #{message.from.first_name}"	
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
