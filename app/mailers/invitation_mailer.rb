class InvitationMailer < ApplicationMailer
  def pending(invitation)
    @firstname = invitation.firstname
    mail to: invitation.email
  end

  def accepted(invitation)
    @firstname = invitation.firstname
    # attachments['invitation.pdf'] = ''
    mail to: invitation.email
  end

  def rejected(invitation, reason)
    @firstname = invitation.firstname
    @reason = reason
    mail to: invitation.email
  end
end
