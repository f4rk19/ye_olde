require 'rails_helper'

describe PhotosController do
  let(:user){ create(:user)}

  describe '#create' do
    let(:params) {{user_id: user.id, photo: attributes_for(:photo)}}

    context 'log in' do
      before do
        login user
      end


      context 'can not save' do
        let(:invalid_params){{user_id:user.id, photo: attributes_for(:photo, content:nil, image:nil)}}

        subject{
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{subject}.not_to change(Photo, :count)
        end

      end
    end
  end
end