class MemberMailer < ActionMailer::Base
  default from: "from@example.com"

  def accepted member_id
    @member = Member.find(member_id)
    mail to: @member.user.email, subject: 'Your application was accepted!', reply_to: @member.fab_space.creator.email
  end

  def rejected member_id
    @member = Member.find(member_id)
    mail to: @member.user.email, subject: 'Your application was rejected', reply_to: @member.fab_space.creator.email
  end

end
