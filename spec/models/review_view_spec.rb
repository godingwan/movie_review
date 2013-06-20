require 'spec_helper'

describe ReviewView do

  it { should belong_to(:review) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:review_id) }

end
