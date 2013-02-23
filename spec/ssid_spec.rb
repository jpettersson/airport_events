require 'spec_helper'
describe SSID do
  it "will raise an error if the airport command is not in PATH." do 
    expect { SSID.parse('-bash: notacommand: command not found') }.to raise_error 
  end

  it "will not raise an error when parsing valid airport output." do
    expect { SSID.parse(IO.read('spec/fixtures/airport.sample.txt')) }.to_not raise_error
  end 
end