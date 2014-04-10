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

    before do
      contact
    end

    it 'displays the contacts matching the provided email' do
      expect(Contact.matching_email('foo')).to eq([contact])
    end

    it 'filters out the contacts not matching the provided email' do
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

    describe '.of_family' do
      it 'displays only the contacts of family group' do
        expect(Contact.of_family).to eq([family_contact])
      end
    end

    describe '.of_work' do
      it 'displays only the contacts of work group' do
        expect(Contact.of_work).to eq([work_contact])
      end
    end

    describe '.of_friends' do
      it 'displays only the contacts of friends group' do
        expect(Contact.of_friends).to eq([friends_contact])
      end
    end
  end

  describe 'ordering scopes' do
    describe '.by_first_name' do
      let(:first_contact) { create(:contact, first_name: 'a') }
      let(:second_contact) { create(:contact, first_name: 'b') }

      before do
        first_contact
        second_contact
      end

      it 'orders the contacts by first name' do
        expect(Contact.all).to eq [first_contact, second_contact]
        expect(Contact.by_first_name(:desc)).to eq [second_contact, first_contact]
      end
    end

    describe '.by_last_name' do
      let(:first_contact) { create(:contact, last_name: 'a') }
      let(:second_contact) { create(:contact, last_name: 'b') }

      before do
        first_contact
        second_contact
      end

      it 'orders the contacts by first name' do
        expect(Contact.all).to eq [first_contact, second_contact]
        expect(Contact.by_last_name(:desc)).to eq [second_contact, first_contact]
      end
    end

    describe '.by_email' do
      let(:first_contact) { create(:contact, email: 'a@example.com') }
      let(:second_contact) { create(:contact, email: 'b@example.com') }

      before do
        first_contact
        second_contact
      end

      it 'orders the contacts by first name' do
        expect(Contact.all).to eq [first_contact, second_contact]
        expect(Contact.by_email(:desc)).to eq [second_contact, first_contact]
      end
    end

    describe '.by_group' do
      let(:first_contact) { create(:contact, group: :family) }
      let(:second_contact) { create(:contact, group: :work) }

      before do
        first_contact
        second_contact
      end

      it 'orders the contacts by first name' do
        expect(Contact.all).to eq [first_contact, second_contact]
        expect(Contact.by_group(:desc)).to eq [second_contact, first_contact]
      end
    end
  end
end
