require 'spec_helper'

describe Contact do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it {
    create(:contact)
    should validate_uniqueness_of(:email)
  }

  describe '.matching_email' do
    let(:contact) { create(:contact, email: 'foo@bar.com') }

    before { contact }

    it 'displays the contacts with email matching the provided text' do
      expect(Contact.matching_email('foo')).to eq([contact])
    end

    it 'filters out the contacts not matching the provided text' do
      expect(Contact.matching_email('whatever')).to_not eq([contact])
    end
  end

  describe '.matching_name' do
    let(:contact) do
      create(:contact, first_name: 'Stefano', last_name: 'Verna')
    end

    before { contact }

    it 'displays the contacts with first name matching the provided text' do
      expect(Contact.matching_email('ste')).to eq([contact])
    end

    it 'displays the contacts with last name matching the provided text' do
      expect(Contact.matching_email('rna')).to eq([contact])
    end

    it 'filters out the contacts not matching the provided text' do
      expect(Contact.matching_email('whatever')).to_not eq([contact])
    end
  end

  describe 'group scopes' do
    let(:family_contact) { create(:contact, group: :family) }
    let(:work_contact) { create(:contact, group: :work) }
    let(:friends_contact) { create(:contact, group: :friends) }

    before do
      family_contact
      work_contact
      friends_contact
    end

    describe '.family' do
      it 'displays only the contacts of family group' do
        expect(Contact.family).to eq([family_contact])
      end
    end

    describe '.work' do
      it 'displays only the contacts of work group' do
        expect(Contact.work).to eq([work_contact])
      end
    end

    describe '.friends' do
      it 'displays only the contacts of friends group' do
        expect(Contact.friends).to eq([friends_contact])
      end
    end
  end

  describe 'ordering scopes' do
    describe '.sort_by_name' do
      let(:first_contact) { create(:contact, last_name: 'a', first_name: 'a') }
      let(:second_contact) { create(:contact, last_name: 'a', first_name: 'z') }
      let(:third_contact) { create(:contact, last_name: 'b', first_name: 'a') }

      before do
        first_contact
        second_contact
        third_contact
      end

      it 'orders the contacts by first name' do
        expect(Contact.sort_by_name(:asc)).to eq [first_contact, second_contact, third_contact]
        expect(Contact.sort_by_name(:desc)).to eq [third_contact, second_contact, first_contact]
      end
    end

    describe '.sort_by_email' do
      let(:first_contact) { create(:contact, email: 'a@example.com') }
      let(:second_contact) { create(:contact, email: 'b@example.com') }

      before do
        first_contact
        second_contact
      end

      it 'orders the contacts by first name' do
        expect(Contact.sort_by_email(:asc)).to eq [first_contact, second_contact]
        expect(Contact.sort_by_email(:desc)).to eq [second_contact, first_contact]
      end
    end

    describe '.sort_by_group' do
      let(:first_contact) { create(:contact, group: :family) }
      let(:second_contact) { create(:contact, group: :work) }

      before do
        first_contact
        second_contact
      end

      it 'orders the contacts by first name' do
        expect(Contact.sort_by_group(:asc)).to eq [first_contact, second_contact]
        expect(Contact.sort_by_group(:desc)).to eq [second_contact, first_contact]
      end
    end
  end
end

