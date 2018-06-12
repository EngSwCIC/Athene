class User < ApplicationRecord
  validates :nick, presence: { :message => "aba não preenchida" }, if: :nick_valid?
  validates :senha, presence: { :message => "aba não preenchida" }
  validates :email, presence: { :message => "aba não preenchida" }, 'valid_email_2/email': { :message => "formato inválido"}

  def nick_valid?
     nick_valid = read_attribute(:nick)
     if !(User.find_by nick: nick_valid).nil?
     	errors[:nick] << "Já cadastrado, utilize outro nick para cadastro"
        false
     end
     true
  end
end
