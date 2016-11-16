require 'rails_helper'

describe Prototype do
  describe 'create' do
    context "with valid attributes" do
      let(:prototype){FactoryGirl.build(:prototype)}
      it "is valid with title, catchcopy, concept" do
        expect(prototype).to be_valid
      end
    end

    context "without valid attributes" do
      it "is without a title" do
        prototype = build(:prototype, name: "")
        prototype.valid?
        expect(prototype.errors[:name]).to include("can't be blank")
      end

      it "is without a catchcopy" do
        prototype = build(:prototype, catch_copy: "")
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it "is without a concept" do
        prototype = build(:prototype, concept: "")
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe 'associations' do
    let(:user){FactoryGirl.create(:user)}
    let(:prototype){FactoryGirl.create(:prototype)}
    it 'is associated with a user' do
      prototype = create(:prototype, user_id: user.id)
      expect(prototype.user).to eq user
    end

    it "is valid to delete comments when prototype is deleted" do
      comment = create(:comment, prototype_id: prototype.id)
      expect{prototype.destroy}.to change{Comment.count}
    end

    it "is valid to delete likes when delete prototype" do
      like = create(:like, prototype_id: prototype.id)
      expect{ prototype.destroy }.to change{ Like.count }
    end
  end

  describe 'posted_date' do
    it "returns dates in a specified format" do
      prototype = build(:prototype, created_at: "2016-10-17")
      expect(prototype.created_at.strftime('%Y年%m月%d日')).to eq ('2016年10月17日')
    end
  end

  describe "liked_by?(user)" do
    context "when liked by a user" do
      it "returns true" do
        user = create(:user)
        prototype = create(:prototype, user: user)
        like = create(:like, prototype_id: prototype.id, user_id: user.id)
        expect(prototype.liked_user?(user)).to be_truthy
      end
    end

    context "when not liked by a user" do
      it "returns nil" do
        user = build(:user)
        prototype = build(:prototype, user_id: user.id)
        expect(prototype.liked_user?(user)).to be_falsey
      end
    end
  end
end
