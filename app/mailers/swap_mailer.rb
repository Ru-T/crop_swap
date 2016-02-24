class SwapMailer < ApplicationMailer

  def new_proposed_swap(email)
    @greeting = "Hi"

    mail to: email, subject: "A New Swap Has Been Proposed!",
    from: "cropswap@cropswap.com"
  end

  def accepted_swap(email)
    @greeting = "Hi"

    mail to: email, subject: "Your Swap Has Been Accepted!",
    from: "cropswap@cropswap.com"
  end

  def rejected_swap(email)
    @greeting = "Hi"

    mail to: email, subject: "News About Your Swap",
    from: "cropswap@cropswap.com"
  end

  def modified_swap(email)
    @greeting = "Hi"

    mail to: email, subject: "A Pending Swap Has Been Modified",
    from: "cropswap@cropswap.com"
  end
end
