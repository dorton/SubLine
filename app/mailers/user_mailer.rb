class UserMailer < ApplicationMailer
  default from: 'subline@subline.com'

  def new_request(teacher, request, subs)
    @teacher = teacher
    @request = request
    @subs = subs
    @url  = 'http://localhost:3000/'
    mail(to: @teacher.email, bcc: @subs, subject: "Sub Request at #{@teacher.schools.map {|school|school.name }.first}")
  end

  def claimed(teacher, request, substitute)
    @teacher = teacher
    @request = request
    @substitute = substitute
    @url  = 'http://localhost:3000/'
    mail(to: @teacher.email, cc: @substitute.email, subject: 'Sub Request Has Been Filled')
  end

  def sub_canceled(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
