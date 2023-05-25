import nltk
from nltk.chat.util import Chat, reflections

pairs = [
 ['my name is (.*)', ['hi %1']],
 ['(hi|hello|hey|hola)', ['Hello there, I hope you are doing well', 'Hi there I hope you are doing well', 'Hey there I hope you are doing well']],
 ['(.*) location', ['We are located in Seattle, WA']],
 ['(.*) (location|city) ?', ['Seattle, WA']],
 ['(.*) (order|details) ?', ['Your order will be delivered shortly.']],
 ['(.*) (return|damaged) ?', ['Sorry for the inconvenience. We shall replace the order soon.']],
 ['(.*) refund', ['Sorry for the inconvenience. We shall refund the order in 3 to 5 business days.']],
 ['(.*)', ['I am sorry, I am not sure I understand you']]
]

def generate_response(user_input):
    chatbot = Chat(pairs, reflections)
    response = chatbot.respond(user_input)
    print(response)
    return response

exit_words = ["bye", "exit", "quit"]

while True:
    user_input = input("User: ")
    if any(word in user_input.lower() for word in exit_words):
        print("Thank you for your time. Have a nice day!")
        exit()
    elif "human" in user_input.lower() or "expert" in user_input.lower() or "talk to" in user_input.lower():
        print("Connecting you with an expert... \nOur expert will connect with you shortly.")
        exit()
    else:
        generate_response(user_input)
