require File.dirname(__FILE__)+ '/../spec_helper'

describe Picture do
  
before :all do
@p1=  Picture.new
end

  describe "init picture" do
    it "we have a picture !" do
    @p1.class.should == Picture 
    end

  end
end

