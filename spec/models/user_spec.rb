require 'rails_helper'

RSpec.describe User, type: :model do
    subject{User.create(name: 'nahom')}
    describe 'Validations' do
        it 'name should be present' do
            subject.name = ''
            expect(subject).to_not be_valid
        end
    end
end