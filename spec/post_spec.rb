
describe 'post' do
  context 'when new user' do
    before do
      # Criar massa de dados atraves do factory
      @new_user = build(:user).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '200' }
  end

  context 'when wrong email' do
    before do
      @new_user = build(:user_wrong_email).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '412' }
    # parsed_response, retorno no formato hash do ruby e tenho acesso ao objeto.
    it { expect(@result.parsed_response['msg']).to eql 'Oops. You entered a wrong email.' }
  end

  context 'when duplicate email' do
    before do
      @new_user = build(:registered_user).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '409' } 
    it { expect(@result.parsed_response['msg']).to eql 'Oops. Looks like you already have an account with this email address.' }
  end

  context 'when empty name' do
    before do
      @new_user = build(:empty_name_user).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '412' } 
    it { expect(@result.parsed_response['msg']).to eql 'Validation notEmpty on full_name failed' }
  end

  context 'when empty email' do
    before do
      @new_user = build(:empty_email_user).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '412' } 
    it { expect(@result.parsed_response['msg']).to eql 'Validation notEmpty on email failed' }
  end

  context 'when empty password' do
    before do
      @new_user = build(:empty_password_user).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '412' } 
    it { expect(@result.parsed_response['msg']).to eql 'Validation notEmpty on password failed' }
  end

  context 'when name is null' do
    before do
      @new_user = build(:null_name_user).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '412' } 
    it { expect(@result.parsed_response['msg']).to eql 'Users.full_name cannot be null' }
  end

  context 'when email is null' do
    before do
      @new_user = build(:null_email_user).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '412' } 
    it { expect(@result.parsed_response['msg']).to eql 'Users.email cannot be null' }
  end

  context 'when password is null' do
    before do
      @new_user = build(:null_password_user).to_hash
      @result = ApiUser.save(@new_user)
    end

    it { expect(@result.response.code).to eql '412' } 
    it { expect(@result.parsed_response['msg']).to eql 'Users.password cannot be null' }
  end
end
