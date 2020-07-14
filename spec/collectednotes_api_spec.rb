RSpec.describe CollectednotesApi do
  it "has a version number" do
    expect(CollectednotesApi::VERSION).not_to be nil
  end

  it 'can configure gem with client keys' do
    api_base  = 'https://collectednotes.com'
    email     = 'example@gmail.com'
    token     = 'asdf2134'

    CollectednotesApi.configure do |config|
      config.email    = email
      config.token    = token
    end

    expect(CollectednotesApi.configuration.api_base).to eq(api_base)
    expect(CollectednotesApi.configuration.email).to eq(email)
    expect(CollectednotesApi.configuration.token).to eq(token)
  end
end
