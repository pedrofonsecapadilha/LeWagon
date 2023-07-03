require "pry"

def tell(who, &message_blk)
  "#{who}, #{message_blk.call}!"
end

def tell_mum(&message_blk)
  tell("mum", &message_blk)
end

def tell_with_proc(who, message_blk)
  "#{who}, #{message_blk.call}!"
end

def tell_mum_with_proc(message_blk)
  tell_with_proc("mum", message_blk)
end
