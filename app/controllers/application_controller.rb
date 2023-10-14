class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url, except: [:sign_in]
  #管理者サインインしていなければ/adminついたページに遷移できないようにする。（sign_in)へ。
  def admin_url
    request.fullpath.include?("/admin")
  end
end
