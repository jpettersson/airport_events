require 'spec_helper'
describe AirportEvents::EventDispatcher do

  class Dog
    include AirportEvents::EventDispatcher
  end

  before(:each) do
    @dog = Dog.new
  end

  it "should accept listeners" do
    @dog.bind :bark do |dBm| end
    @dog.bind :wag do |freq| end

    expect(
      [ @dog.observers[:bark], 
        @dog.observers[:wag]   ].collect{|observer| observer != nil}.length 
    ).to eq(2)

  end

end