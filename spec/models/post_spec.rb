require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @post = Post.new(content: "Lorem ipsum", user_id: user.id)
  end

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
end