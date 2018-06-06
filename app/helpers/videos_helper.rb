module VideosHelper
  def failed_message message
    return message == "É preciso estar logado para comentar"
  end

  def comment_user? id
    if cookies[:login].nil?
      return false
    end
    user = User.find_by nick: cookies[:login]
    if user.nil? 
      return false
    end
    return user.id == id
  end
end
