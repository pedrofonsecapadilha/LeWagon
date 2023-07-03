LOCALES = {
  com: {
    subject: "Our website is online",
    body: "Come and visit us!",
    closing: "See you soon",
    signature: "The Team"
  },
  fr: {
    subject: "Notre site est en ligne",
    body: "Venez nous rendre visite !",
    closing: "A bientot",
    signature: "L'équipe"
  },
  de: {
    subject: "Unsere Website ist jetzt online",
    body: "Komm und besuche uns!",
    closing: "Bis bald",
    signature: "Das Team"
  }
}

def valid?(email)
  email.match?(/[a-zA-Z]+@+[a-zA-Z]+[.]+[a-z]{2,3}/)
end

def clean_database(emails)
  valid_emails = []
  emails.select do |email|
    case valid?(email)
    when true
      valid_emails << email
    end
  end
end

def group_by_tld(emails)
  emails_hash = {}
  emails.each do |email|
    key = email.split(".")
    if emails_hash.include?(key[1])
      emails_hash[key[1]] << email
    else
      emails_hash[key[1]] = [email]
    end
  end
  emails_hash
end

def compose_mail(email)
  username = email.split("@")[0]
  domain = email.split("@")[1].split(".")[0]
  tld = email.split("@")[1].split(".")[1]
  { username: username, domain: domain, tld: tld }
end

def compose_translated_email(email)
  {
    username: compose_mail(email)[:username],
    domain: compose_mail(email)[:domain],
    tld: compose_mail(email)[:tld],

    subject: LOCALES[compose_mail(email)[:tld].to_sym][:subject],
    body: LOCALES[compose_mail(email)[:tld].to_sym][:body],
    closing: LOCALES[compose_mail(email)[:tld].to_sym][:closing],
    signature: LOCALES[compose_mail(email)[:tld].to_sym][:signature]
  }
end
