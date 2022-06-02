namespace :dev do
  desc "Cadastrando os tipos de contatos"
  task setup: :environment do
    puts "resetando o banco de dados"

    %x(rails db:drop db:create db:migrate)

    puts "banco de dados resetado com sucesso!"

    puts "Cadastrando os tipos de contatos"

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos de contatos cadastrados"
  end

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando os contatos"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados"
  end

  desc "Cadastra telefones"
  task setup: :environment do
    puts "Cadastrando os telefones"
    
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone, contact_id: contact.id)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Telefones cadastrados"
  end

  desc "Cadastra os endereços"
  task setup: :environment do
    puts "Cadastrando os endereços"
    
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereços cadastrados"
  end
end
