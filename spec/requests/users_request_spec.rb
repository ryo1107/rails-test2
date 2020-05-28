require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'GET #new' do
    before { get new_user_path }

    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status(:ok)
    end

    it 'newテンプレートをレンダリングすること' do
      expect(response).to render_template :new
    end

    it '新しいuserオブジェクトがビューに渡されること' do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe 'POST #create' do
    context '正しい情報が渡ってきた場合' do
      let(:params) do
        { user: {
            name: 'user',
            password: 'password',
            password_confirmation: 'password',
          }
        }
      end

      it 'ユーザーが一人増えていること' do
        expect { post users_path, params: params }.to change(User, :count).by(1)
      end

      it 'マイページにリダイレクトされていること' do
        expect(post users_path, params: params).to redirect_to(mypage_path)
      end
    end

    context 'パラメータに正しいユーザー名、確認パスワードが含まれていない場合' do
      before do
        post(users_path, params: {
          user: {
            name: 'ユーザー1',
            password: 'passowrd',
            password_confirmation: 'invalid_password',
          }
        })
      end

      it 'リファラーにリダイレクトされること' do
        expect(response).to redirect_to(new_user_path)
      end

      it 'ユーザー名のエラーメッセージが含まれていること' do
        expect(flash[:error_messages]).to include 'パスワード(確認)とパスワードの入力が一致しません'
      end
    end
  end
end
