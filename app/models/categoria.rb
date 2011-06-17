class Categoria < ActiveRecord::Base
    has_and_belongs_to_many :artigos
    default_scope order('nome')
end
