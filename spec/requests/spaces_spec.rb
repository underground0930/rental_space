require 'rails_helper'

RSpec.describe "Spaces", type: :request do
  describe "POST /spaces" do
    context "管理者ユーザーの場合" do
      let(:user) { FactoryBot.create(:user, :admin)}

      it "スペースの予約ができる" do
        sign_in user
        expect(user.admin?).to eq(true)
        expect {
          post spaces_path, params: { space: { name: "スペースA"}}
        }.to change(Space, :count).by(1)
        expect(response).to redirect_to(space_path(Space.last))
      end
    end
    context "一般ユーザーの場合" do    
      let(:user) { FactoryBot.create(:user)}
      it "スペースの予約ができない" do
        sign_in user
        expect {
          post spaces_path, params: { space: { name: "スペースA"}}
        }.to change(Space, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
