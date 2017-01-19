require 'rails_helper'

RSpec.describe User, type: :model do

  context 'attributes' do
    it { should respond_to(:email) }
    it { should respond_to(:pw_func) }
    it { should respond_to(:pw_alg) }
    it { should respond_to(:pw_cost) }
    it { should respond_to(:pw_key_size) }
    it { should respond_to(:pw_nonce) }
    it { should respond_to(:encrypted_password) }
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should allow_value('foobar').for(:email) }
    it { should allow_value('foobar@bar.com').for(:email) }
    it { should allow_value('foo_bar').for(:email) }
    it { should allow_value('1800').for(:email) }
    it { should_not allow_value('#$%^').for(:email) }
  end

  context "with a single user" do
    it "orders items chronologically" do
      u = User.create(email: 'foo@bar.com')
      item1 = u.items.create!
      sleep(1)
      item2 = u.items.create!
      expect(u.reload.items).to eq([item2, item1])
    end
  end

end
