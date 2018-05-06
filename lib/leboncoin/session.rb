module Leboncoin
  # proxy
  # The web session on leboncoin
  class Session
    CONNECTION_TEXT = 'Se connecter'.freeze
    AUTH_FORM_XPATH = "form[action='"\
                      'https://compteperso.leboncoin.fr/store/verify_login/0'\
                      "']".freeze

    attr_reader :session

    def initialize(login, password, driver = :selenium)
      @_login = login
      @_password = password
      @_driver = :selenium
    end

    def session
      @session ||= _initialize_authenticated_session
    end

    private

    attr_reader :_login, :_password, :_driver

    def _initialize_authenticated_session
      _initialize_session
      _do_authentication
      @session
    end

    def _initialize_session
      @session = Capybara::Session.new(_driver)
    end

    def _do_authentication
      session.visit(URL)
      _error_no_login_form unless session.has_content?(CONNECTION_TEXT)
      return unless session.has_content?(CONNECTION_TEXT)
      session.click_on(text: CONNECTION_TEXT)

      session.find(AUTH_FORM_XPATH) do |form|
        form.fill_in 'st_username', with: _login
        form.fill_in 'st_passwd', with: _password
        form.click_button(value: CONNECTION_TEXT)
      end
    end

    def _error_no_login_form
      raise 'No login form found !'
    end

    def method_missing(method_name, *args)
      session.send(method_name, *args)
    end
  end
end
