require 'rails_helper'

RSpec.describe Item, type: :model do

  context 'attributes' do
    it { should respond_to(:content) }
    it { should respond_to(:content_type) }
    it { should respond_to(:enc_item_key) }
    it { should respond_to(:auth_hash) }
    it { should respond_to(:user_uuid) }
    it { should respond_to(:deleted) }
  end

  context "with an Item class" do

    u = User.create(email: 'foo@bar.com')
    u2 = User.create(email: 'foo1@bar.com')
    i = u.items.create!
    i2 = u2.items.create!

    it "belongs to a user" do
      expect(u.uuid).to eql(i.user_uuid)
      expect(u2.uuid).to eql(i2.user_uuid)
    end

    it "has a serializable hash" do
      hash = i.serializable_hash
      expect(hash.is_a?(Hash)).to eql(true)
    end

  end
end
