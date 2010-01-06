require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "TfIdf" do
  describe "Term Frequency" do
    before do
      @a = TfIdf.new(data)
    end
    
    it "should return 0.2" do
      @a.tf[0]['b'].should == 0.2
    end
  end
  
  describe "Inverse Document Frequency" do
    before do
      @a = TfIdf.new(data)
    end
    
    it "should return 0.3010" do
      @a.idf['b'].to_s.should match(/0.30102999/)
    end
  end
    
  before do
    @a = TfIdf.new(data)
  end
  
  it "should return 0.0602" do
    @a.tf_idf[0]['b'].to_s.should match(/0.0602/)
  end

  private
  
  def data
    [%w{a a a a a a a a b b}, %w{a a}]
  end
end