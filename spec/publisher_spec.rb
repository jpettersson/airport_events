require 'spec_helper'
describe AirportEvents::Publisher do

  class Dog
    include AirportEvents::Publisher
  end

  before(:each) do
    @dog = Dog.new
  end

  it "should accept listeners" do
    @dog.subscribe :bark do |dBm| end
    @dog.subscribe :wag do |freq| end

    expect(
      [ @dog.subscribers[:bark], 
        @dog.subscribers[:wag]   ].collect{|subscriber| subscriber != nil}.length 
    ).to eq(2)

  end

end