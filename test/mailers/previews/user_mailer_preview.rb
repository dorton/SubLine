class UserMailerPreview < ActionMailer::Preview
  def new_request
    request = Request.last
    teacher = User.last

    @teacher_schools = User.last.schools.map do |school|
      "%#{school.name}%"
    end
    @subs = User.where(substitute: true).joins(:schools).where("schools.name ILIKE ANY ( array[?] )", @teacher_schools).map do |substitute|
      substitute.email
    end

    subs = @subs
    UserMailer.new_request(teacher, request, subs)
  end

  def claimed
    request = Request.last
    teacher = User.where(teacher: true).joins(:requests).where("requests.id = ?", Request.last).first

    @substitute = User.where(substitute: true).joins(:requests, :schools).where("requests.id = ?", Request.last).first

    substitute = @substitute


    UserMailer.claimed(teacher, request, substitute)
  end




  def sub_canceled
    UserMailer.sub_canceled(User.first)
  end
end
