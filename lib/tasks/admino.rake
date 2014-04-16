namespace :admino do
  desc "Reset db"
  task reset_db: :environment do
    Contact.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('contacts')
    FactoryGirl.create_list(:contact, 100)
  end
end

