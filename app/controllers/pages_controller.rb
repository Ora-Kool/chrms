class PagesController < ApplicationController
  def home
  end

  def about
  end
  def contact
  	@message = Message.new
  end
  def send_message
  	@message  = Message.new(message_params)
    if @message.save
      flash[:secondary] = "Your message has been sent."
       redirect_to contact_path
    else
      render "contact"
    end
  end
  def login
  end
  private 
  def message_params
    params.require(:message).permit(:name, :subject, :content)
  end
end
