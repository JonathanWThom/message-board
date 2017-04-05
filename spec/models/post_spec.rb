require 'rails_helper'

describe Post do
  it { should have_many :comments }
  it { should belong_to :user }
  it { should validate_presence_of :body }
  it { should validate_presence_of :title }
end
