require 'spec_helper'

describe Plist do
  
  it "validates the presence of filename,executable" do
    plist = Plist.new
    %w[filename executable].each do |attr|
      plist.should have(1).error_on(attr)
    end
  end
  
  it "validates that the input filename ends in plist" do
    plist = Factory.build(:plist, :filename => 'com.plist.bad')
    plist.should have(1).error_on(:filename)
  end
  
  it "validates that the input executable begins with a '/' or a '~/'" do
    plist = Factory.build(:plist, :executable => 'bad')
    plist.should have(1).error_on(:executable)
  end
  
end
