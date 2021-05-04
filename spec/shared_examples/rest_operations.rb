RSpec.shared_examples_for 'find' do |operations|
  it 'gets expected successful response' do
    response = described_class.find(resource_id)
    expect(dig_keys(response)).to eq(successful_find_response)
  end

  it 'gets expected error response' do

  end
end
