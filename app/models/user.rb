class User < ApplicationRecord
	validates :nick, presence: { :message => "aba não preenchida" }
	validates :senha, presence: { :message => "aba não preenchida" },
		length: { minimum:8, :message => "precisa ter no mínimo 8 caracteres" }
	validates :email, presence: { :message => "aba não preenchida" }, 'valid_email_2/email': { :message => "formato inválido"}
end
