require 'spec_helper'

describe 'Belongs To Relationships' do

  let(:user){
    u = User.create(:first_name => 'Mike', :last_name => 'Middlesworth')
    u.update_attribute(:parent_id, u.id)
    u.reload
  }

  it 'should allow belongs_to relationships to be accessible via the cache' do
    User.new.should respond_to(:cached_parent)
  end

  it 'should not hit the cache when the belongs_to is used normally' do
    user.should_receive(:dv8!).never
    user.parent.should eql(user)
  end

  it 'should check the cache when a belongs_to is hit with the cache' do
    user.should_receive(:dv8!).never
    user.cached_parent.should eql(user)
  end

end