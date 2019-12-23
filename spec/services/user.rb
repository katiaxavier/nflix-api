
class ApiUser
    include HTTParty
    base_uri 'http://localhost:3001'
    headers 'Content-Type' => 'application/json'

    #self é importante porque vai usar o metodo da classe ApiUser que vai fazer include/acessar de todos os recursos do HTTParty.
    def self.save(user)
        post('/user', body: user.to_json)
    end
end