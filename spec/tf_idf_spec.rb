require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "TfIdf" do
  [[:regular, SampleData.regular_data],
   [:sparse, SampleData.sparse_data]].each do |pair|
    context "#{pair[0]} representation" do
      before do
        @a = pair[0] == :sparse ? TfIdf.new(pair[1], sparse=true) : TfIdf.new(pair[1])
      end

      describe "Term Frequency" do
        it "should return 0.2" do
          @a.tf[0]['b'].should == 0.2
        end
      end

      describe "Inverse Document Frequency" do
        it "should return 0.3010" do
          @a.idf['b'].to_s.should match(/0.30102999/)
        end
      end

      it "should return 0.0602" do
        @a.tf_idf[0]['b'].to_s.should match(/0.0602/)
      end
    end
  end
end
