require 'spec_helper'

describe Comment do

  #before :all do
  #  #WebMock.disable_net_connect!  # seems to be disabled by default
  #end

  it 'gets remote validations' do
    stub_request(:post, %r{comments\.json}).to_return(body: {errors: {body: ["can't be blank"]}}.to_json, status: 422)
    comment = Comment.create
    comment.errors['body'].should == ["can't be blank"]
    
    a_request(:post, %r{comments\.json}).should_not have_been_made
  end

end
