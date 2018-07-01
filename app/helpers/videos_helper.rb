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

  def user_video id
    if id == -1
      return "Anonymous"
    else
      user_reg = User.find(id)
      if user_reg.nil?
        user = "Anonymous"
      else
        user = user_reg.nick
      end
    end
    return user
  end

  def token string
    if failed_message string
      return 'bad_token'
    end
    return 'good_token'
  end
end
