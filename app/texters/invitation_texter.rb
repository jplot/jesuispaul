class InvitationTexter < ApplicationTexter
  def pending(invitation)
    @firstname = invitation.firstname
    text to: invitation.phone_number
  end

  def accepted(invitation)
    @firstname = invitation.firstname
    text to: invitation.phone_number, media_urls: ["#{root_url}invitation.pdf"]
  end

  def rejected(invitation, reason)
    @firstname = invitation.firstname
    @reason = reason
    text to: invitation.phone_number
  end
end
