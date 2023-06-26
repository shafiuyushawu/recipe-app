require 'rails_helper'

RSpec.describe Recipe, type: :model do
    chef = User.create(name: 'shafiu')
    subject{Recipe.create(name: 'recipe 1', preparation_time: 40, cooking_time: 140, description:'it is the most amazing recipe on the planet', public: true, user: chef)}
    describe 'Validations' do
        it 'name should be present' do
            subject.name = ''
            expect(subject).to_not be_valid
        end
        it 'preparation_time should be present' do
            subject.preparation_time = nil
            expect(subject).to_not be_valid
        end
        it 'cooking_time should be present' do
            subject.cooking_time = nil
            expect(subject).to_not be_valid
        end
        it 'description should be present' do
            subject.description = nil
            expect(subject).to_not be_valid
        end
        
        it 'preparation_time and cooking_time should be numeric' do
            expect(subject).to_not be_valid unless subject.preparation_time.is_a?(Numeric) && subject.cooking_time.is_a?(Numeric) 
        end

        it 'preparation_time and cooking_time should be greater than or equals to zero' do
            subject.preparation_time = -1
            subject.cooking_time = -2
            expect(subject).to_not be_valid  
        end

    end
end