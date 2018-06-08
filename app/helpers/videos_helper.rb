module VideosHelper
  def failed_message message
    return message == "É preciso estar logado para comentar"
  end

  def comment_user? id,logon=cookies[:login]
    if logon.nil?
      return false
    end
    user = User.find_by nick: logon
    if user.nil? 
      return false
    end
    return user.id == id
  end
end
