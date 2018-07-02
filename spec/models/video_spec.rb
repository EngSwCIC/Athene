require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:valid_attributes){
  	{ title: 'algumacoisa', description: 'teste', user: 0 , arq_video: "#{Rails.root}/features/videos/teste.mp4", valid: "test.mp4" }
  }

  let(:invalid_attributes){
  	{ title: '', description: 'algumacoisa' }
  }

  it "validado com atributos validos" do
    expect(Video.new(valid_attributes)).to be_valid
  end

  it "validado com atributos invalidos" do
    expect(Video.new(invalid_attributes)).to_not be_valid
  end
end
