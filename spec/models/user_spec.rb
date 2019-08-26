require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  fixtures :users

  before(:context) do
    @valid_user = User.new(name: "valid user", 
                            email: "valid_user@abc.com",
                            password: "foobar",
                            password_confirmation: "foobar" )

    @invalid_user = User.new( name: "invalid user", 
                              email: "invalid_user@abc.com",
                              password: "foobar",
                              password_confirmation: "foobar" )
  end

  
  it "is valid with name, email, and password" do 
    expect(@valid_user).to be_valid
  end

  it "is not valid with blank name or blank email" do
    @invalid_user.name = ""
    @invalid_user.email = ""
    
    @invalid_user.valid?
    
    expect(@invalid_user.errors[:name]).to include("can't be blank")
    expect(@invalid_user.errors[:email]).to include("can't be blank")
  end
  
  it "is not valid with bad email format" do
    @invalid_user.email = "test@yahoo"
    @invalid_user.valid?

    expect(@invalid_user.errors[:email]).to include("is invalid")
  end



end