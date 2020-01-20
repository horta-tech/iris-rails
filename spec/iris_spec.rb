RSpec.describe Iris do
  it "has a version number" do
    expect(Iris::VERSION).not_to be nil
  end

  it "performs" do
    expect(Iris.perform).to eq("performing")
  end
end
