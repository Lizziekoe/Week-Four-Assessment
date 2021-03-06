require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many(:bands)}

  it("validates the presence of a venue") do
    venue = Venue.new({:name => ''})
    expect(venue.save()).to(eq(false))
  end

  describe("upcase") do
    it("should capitalize the first letter of each word") do
      venue_test = Venue.create({:name => "the crystal ballroom"})
      expect(venue_test.upcase().to(eq(The Crystal Ballroom)))
    end
  end
end
