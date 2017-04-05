require 'rails_helper'

describe 'the posts path' do
  it 'will create a new post', js: true do
    user = create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Create a Post'
    fill_in 'Title', :with => 'The Title'
    fill_in 'Body', :with => 'The Body'
    click_on 'Create Post'
    expect(page).to have_content('The Title')
  end
end
