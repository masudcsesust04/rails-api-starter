require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:todos) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  # it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('admin@example.com').for(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should have_secure_password }
end
