require 'rails_helper.rb'

RSpec.describe Photo, type: :model do
  describe '#create' do
    context 'can save' do
      it "is valid with a content" do
        expect(build(:photo)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without a content' do
        photo = build(:photo, content: nil)
        photo.valid?
        expect(photo.errors[:content]).to include("can't be blank")
      end

      it "is invalid without an image" do
        photo = build(:photo, image: nil)
        photo.valid?
        expect(photo.errors[:image]).to include("can't be blank")
      end

      it "is invalid without an user_id" do
        photo = build(:photo, user_id: nil)
        photo.valid?
        expect(photo.errors[:user]).to include("must exist")
      end
    end
  end
end
