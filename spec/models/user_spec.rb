require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.username = "Anything"
    subject.firstname = "Anything"
    subject.lastname = "Anything"
    subject.gender = "Male"
    subject.birthday = DateTime.now - 1.week
    subject.email = 'Any@email.com'
    subject.password = 'abcdefg'
    expect(subject).to be_valid
  end

  it "is valid with a username" do 
    subject.username = "Anything"
  end
end
