def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  if a_string == ""
    false
  else
    a_string = a_string.gsub(/[\s,'!-]/, "").downcase
    b_string = a_string.reverse
    a_string == b_string
  end
end

# COLOCAR A STRING TODO EM MÍNUSCULA
# RETIRAR CARACTERES ESPECIAIS E ESPAÇOS DO TEXTO
# FAZER O REVERSE
# TESTAR SE A STRING É IGUAL A STRING.REVERSE
