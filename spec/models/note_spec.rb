require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "#category" do 
    it "correctly identifies categories" do 
      expect(Note.category(1)).to_not eq "More of..."
      expect(Note.category(2)).to_not eq "More of..."
      expect(Note.category(3)).to eq "More of..."
      expect(Note.category(4)).to_not eq "More of..."
    end
  end
end
