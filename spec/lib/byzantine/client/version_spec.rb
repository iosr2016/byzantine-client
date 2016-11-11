RSpec.describe Byzantine::Client do
  it 'defines current version' do
    expect(Byzantine::Client::VERSION).not_to be nil
  end
end
