def ip_to_num(ip_address)
  # TODO: return the number version of the `ip_address` string
  ip_address_b = []
  ip_address.split(".").each { |number| ip_address_b.push(number.to_i.to_s(2).rjust(8, "0")) }
  ip_address_b = ip_address_b.join.to_i(2)
end

def num_to_ip(number)
  # TODO: return the string IP address from the `number`
  number_b = []
  number.to_s(2).rjust(32, "0").chars.each_slice(8).map(&:join).each { |i| number_b.push(i.to_i(2)) }
  number_b.join(".")
end
