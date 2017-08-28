class Products < ApplicationCable::Channel  
  def subscribed
    stream_from "product_#{params[:product_name]}"

    backlog = []
    features = []
    done = []
    p 'CONNARD'
    p Product.find_by(name: params[:product_name])
    Product.find_by(name: params[:product_name]).cards.order(:position).each do |card|
      case card.col_name
      when 'backlog'
        backlog << {id: card.id, content: card.content, position: card.position }
      when 'features'
        features << {id: card.id, content: card.content, position: card.position }
      when 'done'
        done << {id: card.id, content: card.content, position: card.position }
      end
    end
    ActionCable.server.broadcast "product_#{params[:product_name]}", {
      backlog: backlog,
      features: features,
      done: done
    }
  end

  def update(data)
    stream_from "product_#{params[:product_name]}"

    data['threads'].each do |thread|
      if thread['id'] == -1
        card = Product.find_by(name: "#{params[:product_name]}").cards.new
      else
        card = Card.find(thread['id'])
      end
      card.content = thread['content']
      card.position = thread['position']
      card.col_name = data['colName']
      card.save
    end

    backlog = []
    features = []
    done = []
    Product.find_by(name: params[:product_name]).cards.order(:position).each do |card|
      case card.col_name
      when 'backlog'
        backlog << {id: card.id, content: card.content, position: card.position }
      when 'features'
        features << {id: card.id, content: card.content, position: card.position }
      when 'done'
        done << {id: card.id, content: card.content, position: card.position }
      end
    end
    ActionCable.server.broadcast "product_#{params[:product_name]}", {
      backlog: backlog,
      features: features,
      done: done
    }
  end
end