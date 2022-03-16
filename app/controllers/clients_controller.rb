class ClientsController < ApplicationController
    def index
        clients = Client.all 
        render json: clients
      end
    
      def show
        client = find_client
        render json: client
      end
    
      def update
          client = find_client
          client.update(client_params)
          render json: client
      end
  
      private
  
      def find_client
          Client.find_by(id: params[:id])
      end
    
      def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
      end
  
      def client_params
          params.permit(:name, :age)
      end
  
end
