module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCableUser', current_user
      logger.add_tags 'ActionCableProduct', request.params[:product_name]
    end

    private
    def find_verified_user
      if (current_user = User.find_by(authentication_token: request.params[:token], email: request.params[:email])) &&
        (product = Product.find_by(name: request.params[:product_name]))
        current_user if Product.users.find(current_user) rescue nil
      end
       (current_user && product) ? current_user : reject_unauthorized_connection 
    end
  end
end
