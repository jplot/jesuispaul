class WeddingController < ApplicationController
  def index
  end

  def create
    invitation = Invitation.new(invitation_params)

    if invitation.save
      if invitation.email.present?
        InvitationMailer.pending(invitation).deliver_now
      elsif invitation.phone_number.present?
        InvitationTexter.pending(invitation).deliver
      end

      redirect_to mariage_url, success: "Merci pour votre réponse !"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:firstname, :lastname, :email, :phone_number, :comment)
  end
end
