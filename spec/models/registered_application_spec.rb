require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  it { should belong_to :user }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :url }
  it { should validate_presence_of :user }
end
