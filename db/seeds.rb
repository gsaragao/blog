# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

usuario = Usuario.create :email => 'usuario@couggi.com', 
                         :senha => '1234',
                         :senha_confirmation => '1234'
Categoria.create [{:nome => 'Programacao'}, 
                 {:nome => 'Evento'},
                 {:nome => 'Viagem'},
                 {:nome => 'Musica'},
                 {:nome => 'TV' }]
usuario.artigos.create :titulo => 'Avancado Active Record',
                       :corpo => 'Moledos sao punks',
                       :publicacao => Date.today
usuario.artigos.create  :titulo => 'Associacao',
                        :corpo => 'Active Record makes',
                        :publicacao => Date.today                        
                     