def colorful?(number)
  n = number.to_s.chars
  case n.length
  when 1
    true
  when 2
    n.push((n[0].to_i * n[1].to_i).to_s)
    n.each_cons(2).any? { |s, t| s == t } ? false : true
  when 3
    n.push((n[0].to_i * n[1].to_i).to_s)
    n.push((n[1].to_i * n[2].to_i).to_s)
    n.push((n[0].to_i * n[2].to_i).to_s)
    n.push((n[0].to_i * n[1].to_i * n[2].to_i).to_s)
    n.each_cons(2).any? { |s, t| s == t } ? false : true
  else
    false
  end
end
