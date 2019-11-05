class EventsController < ApplicationController 
  def index
    @allevents = Event.all
  end  
  
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
      puts "$" * 60
      puts "ceci est le contenu de params :"
      puts params
      @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
      
      #user_id: 11 correspond à l'ID anonymous après généré 10 Fakers Users via seed et créé manuellement l'user anonymous dans la console.

      if @event.save # essaie de sauvegarder en base @gossip
        # si ça marche, il redirige vers la page d'index du site
        @event = Event.all
        redirect_to root_path
      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        render :new
      end

  end

  def edit
    #@gossip = Gossip.find(params[:id])
  end

  def update
    #@gossip = Gossip.find(params[:id])
    #if @gossip.update(title: params[:title], content: params[:content])
    #  redirect_to root_path
    #else
    #  render :edit
    #end
  end

  def destroy
    #@gossip = Gossip.find(params[:id])
    #@gossip.destroy!
    #redirect_to root_path, :notice => "Your patient has been deleted"
  end
end
  
  
  

  