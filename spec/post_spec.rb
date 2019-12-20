describe 'cadastro' do
  it 'novo usuario' do
    result = HTTParty.post(
      'http://localhost:3001/user',
      body: { full_name: 'katia', email: 'katia@xavier.com', password: '123456' }.to_json,
      headers: {
        'Content-Type' => 'application/json'
      }
    )
    expect(result.response.code).to eql '200'
  end
end
