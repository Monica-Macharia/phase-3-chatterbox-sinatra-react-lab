class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
 
    
    
    
    post "/messages" do
      news = Message.create(body: params[:body], username: params[:username])
      news.to_json
    end
    
    patch "/messages/:id" do
      text = Message.find(params[:id])
      text.update(body: params[:body])
      text.to_json
    end
    get "/messages" do
      texts = Message.all.order(:created_at)
      texts.to_json
    end
    
    delete "/messages/:id" do
      texts = Message.find(params[:id])
      texts.destroy
      texts.to_json
    end
    

  
end
