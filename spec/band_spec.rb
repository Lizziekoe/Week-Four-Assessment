require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many(:venues)}

  it("validates the presence of a band") do
    band = Band.new({:name => ''})
    expect(band.save()).to(eq(false))
  end

  describe("upcase") do
    it("should capitalize the first letter of each word") do
      band_test = Band.create({:name => "dr. dog"})
      expect(band_test.upcase().to(eq(Dr. Dog)))
    end
  end
end
