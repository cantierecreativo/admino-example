require 'spec_helper'

feature 'As a visitor' do
  let(:index_page) { Contacts::IndexPage.new }
  let(:new_page) { Contacts::NewPage.new }
  let(:edit_page) { Contacts::EditPage.new }


  scenario 'I want to add a new contact' do
    new_page.load

    new_page.save!('Jon', 'Doe', 'john@doe.com', 'family')

    expect(new_page).to have_notice
  end

  context 'given a contact' do
    let(:contact) { create(:contact) }

    before do
      contact
    end

    scenario 'I want to see it in the list' do
      index_page.load

      expect(index_page).to have_record(contact)
    end

    scenario 'I want to edit it' do
      edit_page.load(id: contact.id)

      edit_page.save!('Luther', 'Blisset', 'luther@blisset.com', 'work')

      expect(edit_page).to have_notice
    end
  end
end
