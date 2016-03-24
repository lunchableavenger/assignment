class ArticlesController < ApplicationController

  def index
      @articles = Article.all
  end

  def show
      @article = Article.find(params[:id])

      require 'rubygems'
      require 'twilio-ruby'

      account_sid = "ACe74faab3cf4578d6d0a2cb7b97f13a2b"
      auth_token = "6b4b2ca19daa05f2e43ed8c269fa15ac"
      client = Twilio::REST::Client.new account_sid, auth_token

      from = "+19109332027" # Your Twilio number

      friends = {
      @article.phone_number => "Caylee OMFG",
      }
      friends.each do |key, value|
        client.account.messages.create(
          :from => from,
          :to => key,
          :body => @article.message
        )
        puts "Sent message to #{@article.phone_number}"
      end
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(params.require(:article).permit(:phone_number, :message))

    if @article.save
        redirect_to @article
    else
        render 'new'
    end
  end


  private
    def article_params
      params.require(:article).permit(:phone_number, :message)
    end

end
