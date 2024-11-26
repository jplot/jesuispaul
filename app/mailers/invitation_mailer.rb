class InvitationMailer < ApplicationMailer
  def pending(invitation)
    @firstname = invitation.firstname
    mail to: invitation.email
  end

  def accepted(invitation)
    @firstname = invitation.firstname
    attachments["invitation.pdf"] = Rails.root.join("public", "invitation.pdf").read
    mail to: invitation.email
  end

  def rejected(invitation, reason)
    @firstname = invitation.firstname
    @reason = reason
    mail to: invitation.email
  end
end
