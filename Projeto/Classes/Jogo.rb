class Jogo
	attr_accessor :mortes, :jogadores, :causaMorte
	attr_reader :id
	@@idGame = 0
	def initialize()
		@id = (@@idGame = @@idGame + 1)
		@mortes = 0
		@jogadores = Hash.new
		@causaMorte = Hash.new(0)
	end
	
	def matou
		@mortes = @mortes + 1
	end
	
	def imprimir
		"Jogo #{@id}: { \n" +
		"    Total de mortes: #{@mortes}, \n" +
		"    Jogadores: #{@jogadores.keys} \n" +
		"    Mortes: { \n      " + 
		   @jogadores.map{ |key,valor| " #{key} : #{valor.pontuacao}\n"}.join("      ")+"\n" +
		"   }\n" +
		"    Causa das mortes: \n       " +
		causaMorte.map { |key, valor| "#{key} : #{valor}\n" }.join("       ")+"\n\n\n"+
		"}\n\n"
		
	end
end