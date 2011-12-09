require 'spec_helper'

describe Trip do
  #before :all do
  #  #WebMock.disable_net_connect!   # seems to be disabled by default
  #end

  context "known attributes" do
    %w(name id created_at updated_at).each do |attr|
      it "includes #{attr}" do
        trip = Trip.new
        trip.should respond_to(attr)
      end
    end

    it 'enforces correct type conversion for dates' do
      stub_request(:get, %r{trips/1\.json}).to_return(:body => {name: 'NoCal', created_at: Time.now, id: '1'}.to_json, :status => 200,  :headers => { 'Content-Type' => 'application/json' } )

      trip = Trip.find(1)
      trip.created_at.should be_kind_of(DateTime)
    end

    it 'can create a trip' do
      stub_request(:post, %r{trips\.json})
      Trip.create(name: 'NoCal')
      a_request(:post, %r{trips\.json$}).with(body: {trip: {name: 'NoCal'}}.to_json).should have_been_made
    end

    context 'Validation' do
      it 'enforces client-side validation on create' do
        stub_request(:post, %r{trips\.json})
        trip = Trip.create
        trip.should_not be_valid
        trip.errors[:name].should == ["can't be blank"]
        a_request(:post, %r{trips\.json$}).should_not have_been_made
      end

      it 'reports server-side errors' do
        stub_request(:post, %r{trips\.json})
      end

    end

  end

end
