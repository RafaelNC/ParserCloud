class Jogador
	attr_accessor :nome, :pontuacao
	
	def initialize(nome)
		@nome = nome
		@pontuacao = 0
	end
	
	def add_ponto
		@pontuacao = @pontuacao + 1
	end
	
	def dec_ponto
		@pontuacao = @pontuacao - 1
	end
	
	def	to_s
		"Jogador: #{@nome}, #{@pontuacao} mortes."
	end
end
	