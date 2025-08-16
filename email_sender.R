for (i in seq_len(nrow(subscribers))) {
  smtp_send(
    email = email_list[[i]],
    from = "youremail@gmail.com",
    to = subscribers$email[i],
    subject = "Daily Data Update",
    credentials = creds(
      host = "smtp.gmail.com",
      port = 587,
      user = "youremail@gmail.com",
      pass = "your_app_password"
    )
  )
}


smtp_send(
  email = email,
  from = "tobias.hector@hotmail.com",
  to = "tobias.hectorr19@gmail.com",
  subject = "Daily Data Update",
  credentials = creds(
    host = "smtp.office365.com",
    port = 587,
    user = "tobias.hector@hotmail.com"
  )
)


create_smtp_creds_file(
  file = "outlook_creds",                  # file name
  user = "tobias.hector@hotmail.com",      # your Outlook email
  provider = "office365",                  # sets host = smtp.office365.com, port = 587
  password = "mkjxkrhsgpeaxdah"            # your Microsoft app password
)

smtp_send(
  email = email,
  from = "tobias.hector@hotmail.com",
  to = "tobias.hectorr19@gmail.com",   # replace with your test inbox
  subject = "Daily Data Update - Test",
  credentials = creds_file("outlook_creds")
)


