require 'rails_helper'

describe PrototypesController do
   let!(:prototype) { create(:prototype) }
   let!(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, name: 'hoge')
   }}
   let!(:invalid_params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, name: nil)
   }}

  context 'with user login' do
    login_user

    describe 'GET #index' do
      before do
        get :index
      end

      it 'assigns the requested prototypes to @prototypes' do
        prototypes = create_list(:prototype, 8);
        expect(assigns(:prototypes)).to match_array(Prototype.limit(8))
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end

      it 'assignes the requested prototype to @prototype' do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      context 'with valid attribtues' do
        before do
          post :create, params
        end

        it 'saves the new prototype in the database' do
          expect { post :create, params }.to change(Prototype, :count).by(1)
        end

        it 'redirects to root_path' do
          expect(response).to redirect_to root_path
        end

        it 'shows flash messages to show save the prototype successfully' do
          expect(flash[:notice]).to eq "New prototype was successfully created"
        end
      end

      context 'with invalid attribtues' do
        before do
          post :create, invalid_params
        end

        it 'does not save the new prototype in the database' do
          expect { post :create, invalid_params }.not_to change(Prototype, :count)
        end

        it 'redirects new_prototype_path' do
          expect(response).to redirect_to new_prototype_path
        end

        it 'shows flash messages to show save the prototype unsuccessfully' do
          expect(flash[:alert]).to eq 'New prototype was unsuccessfully created'
        end
      end

    end

    describe 'GET #show' do
      before do
        get :show, id: prototype.id
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'assigns likes associated with prototype to @likes' do
        expect(assigns(:likes)).to eq prototype.likes_count
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, id: prototype.id
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns main_image to @main_content' do
        expect(assigns(:main_content)).to eq prototype.prototype_images.first
      end

      it 'assigns sub_images to @sub_contents' do
        expect(assigns(:sub_contents)).to eq prototype.prototype_images.sub
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        before do
          patch :update, params
        end
        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'updates attributes of prototype' do
          prototype.reload
          expect(prototype.name).to eq 'hoge'
        end

        it 'redirects to prototype_path'  do
          expect(response).to redirect_to prototype_path(prototype)
        end
      end

      context 'with invalid attributes' do
        before do
          patch :update, invalid_params
        end

        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'does not save the new prototype' do
          prototype.reload
          expect(prototype.name).not_to eq 'hoge'
        end

        it 'renders the :show template' do
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do

      before do
        delete :destroy, id: prototype.id
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

     it 'deletes the prototype' do
       prototype = create(:prototype)
       expect{ delete :destroy, id: prototype.id }.to change(Prototype, :count).by(-1)
     end

     it 'redirects to root_path' do
       expect(response).to redirect_to root_path
     end

     it 'shows flash message to show delete prototype successfully' do
       expect(flash[:notice]).to eq 'The prototype was successfully deleted'
     end
    end
  end

  context 'without user login' do
    describe 'GET #new' do
      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'post #create' do
      it 'redirects sign_in page' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: prototype.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, id: prototype.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects sign_in page' do
        delete :destroy, id: prototype.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
