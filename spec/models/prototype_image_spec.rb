require 'rails_helper'

describe PrototypeImage do
  describe '#create' do
    describe "with valid attributes" do
      it "has a valid factory" do
        prototype_image = build(:prototype_image, :main)
        expect(prototype_image).to be_valid
      end
    end

    describe "without image attribute" do
      it "returns error" do
        prototype_image = build(:prototype_image, image: nil)
        prototype_image.valid?
        expect(prototype_image.errors[:image]).to include("can't be blank")
      end
    end

    describe "without status attribute" do
      it "returns error" do
        prototype_image = build(:prototype_image, status: nil)
        prototype_image.valid?
        expect(prototype_image.errors[:status]).to include("can't be blank")
      end
    end
  end
end
