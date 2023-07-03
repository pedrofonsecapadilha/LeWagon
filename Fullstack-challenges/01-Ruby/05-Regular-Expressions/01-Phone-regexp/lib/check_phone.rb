def french_phone_number?(phone_number)
  # TODO: true or false?
  phone_number.gsub(/\D/, "").match?(/^0\s*[1-9]\d{8}|^33\s*[1-9]\d{8}/)
end
