require 'rails_helper'

describe User do
  it { should have_many :posts }
  it { should have_many :comments }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :signature }
end
