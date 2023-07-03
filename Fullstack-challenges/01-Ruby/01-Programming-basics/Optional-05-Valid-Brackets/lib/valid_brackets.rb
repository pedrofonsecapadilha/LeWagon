def valid_brackets?(string)
  t1 = string.count("(") == string.count(")")
  t2 = string.count("[") == string.count("]")
  t3 = string.count("{") == string.count("}")
  t1 == false || t2 == false || t3 == false ? false : true
end
