def coach_answer(your_message)
  # TODO: return coach answer to your_message

  # If you don’t ask: "I don't care, get dressed and go to work!"
  # If you ask: "Silly question, get dressed and go to work!"
  # The only way:"I am going to work right now!"

  if your_message == "I am going to work right now!"
    "" # Tem que descobrir como que fecha o programa
  elsif your_message.include? "?"
    "Silly question, get dressed and go to work!"
  else
    "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!

  case your_message
  when "I AM GOING TO WORK RIGHT NOW!"
    ""
  when your_message.upcase
    "I can feel your motivation! #{coach_answer(your_message)}"
  else
    coach_answer(your_message)
  end
end
