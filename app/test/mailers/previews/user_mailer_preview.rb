class UserMailerPreview < ActionMailer::Preview
  def new_request
    UserMailer.new_request(User.first)
  end

  def claimed
    UserMailer.claimed(User.first)
  end

  def sub_canceled
    UserMailer.sub_canceled(User.first)
  end
end
