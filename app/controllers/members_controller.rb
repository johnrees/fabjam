class MembersController < ApplicationController
  load_and_authorize_resource

  def accept
    @member = Member.find(params[:id])
    if @member.accept!
      MemberMailer.accepted(@member.id).deliver
      redirect_to :back, notice: 'Member Accepted'
    else
      redirect_to :back, notice: 'There was an error'
    end
  end

  def reject
    @member = Member.find(params[:id])
    if @member.reject!
      MemberMailer.rejected(@member.id).deliver
      redirect_to :back, notice: 'Member Rejected'
    else
      redirect_to :back, notice: 'There was an error'
    end
  end

end
