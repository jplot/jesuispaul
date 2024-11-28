class InvitationTexter < ApplicationTexter
  def pending(invitation)
    @firstname = invitation.firstname
    content = "Cher #{@firstname},\n\n" \
      "Nous avons bien reçu ton intention de présence à notre mariage et te remercions pour l'intérêt que tu portes à notre union.\n\n" \
      "Nous te recontacterons très prochainement pour te confirmer si nous pouvons t'ajouter à la liste des invités.\n\n" \
      "Avec toute notre affection,\n" \
      "Jonathan et Paul"

    text to: invitation.phone_number, body: content
  end

  def accepted(invitation)
    @firstname = invitation.firstname
    content = "Cher #{@firstname},\n\n" \
      "Nous revenons à toi suite à ton intention de présence à notre mariage et te remercions encore une fois pour l'intérêt que tu portes a notre union.\n\n" \
      "C'est avec plaisir que nous aimerions t'inviter à notre mariage !\n" \
      "Nous serions ravis de te compter parmi nos invités et de partager ce jour spécial avec toi.\n" \
      "Tu trouveras ci-joint l'invitation officielle avec tous les détails concernant la cérémonie et la réception.\n\n" \
      "Avec toute notre affection,\n" \
      "Jonathan et Paul"

    text to: invitation.phone_number, body: content, media_urls: ["#{root_url}invitation.pdf"]
  end

  def rejected(invitation, reason)
    @firstname = invitation.firstname
    @reason = reason
    content = "Cher #{@firstname},\n\n" \
      "Nous revenons à toi suite à ton intention de présence à notre mariage et te remercions encore une fois pour l'intérêt que tu portes a notre union.\n\n" \
      "Nous te remercions sincèrement pour ta demande.\n" \
      "Malheureusement, #{@reason}.\n" \
      "Nous espérons que tu comprendras notre situation. Nous te souhaitons tout le meilleur.\n\n" \
      "Avec toute notre affection,\n" \
      "Jonathan et Paul"

    text to: invitation.phone_number, body: content
  end
end
