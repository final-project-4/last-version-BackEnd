class MessagesController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

    def create
        message = Message.new(message_params)
        conversation = Conversation.find(message_params[:conversation_id])
        if message.save
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MessageSerializer.new(message)
          ).serializable_hash
          MessagesChannel.broadcast_to conversation, serialized_data
          head :ok
        end
      end

      def update 
        @message.update_attributes(message_params)
        render json: @message
    end
    
    
    def destroy
        @message.destroy
        render json: {message:"success"}
    end 
        
      
      private
      
      def message_params
        params.require(:message).permit(:text, :conversation_id)
      end
end
