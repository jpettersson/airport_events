require 'spec_helper'
describe AirportEvents::Publisher do

  it 'should throw and exception when the airport command is not in path' do

    expect {
      $?.exitstatus = 1
      ::AirportEvents::Airport.ensure_airport_command!
    }.to raise_error

  end

end