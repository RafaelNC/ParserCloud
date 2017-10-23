load 'Classes/Jogador.rb'
load 'Classes/Jogo.rb'

class Analise
	#analisando e encontrato dados
	#define variaveis da classe que serão apenas acessadas - substitui a declaracao de um método para retornar o valor dessas variaveis
	attr_reader :jogos, :file
	
	#método inicial da classe - é carregado ao instanciar cada objeto do tipo Analise
	def initialize
		#abre arquivo
		@file = File.open("arquivo/qgames.log","r")
		#inicia um array
		@jogos = []
		#varre linha a linha até o fim do arquivo atribuindo o conteudo da linha à variavel
		@file.each do |linha|
			if inicio_jogo?(linha)
				@jogos << Jogo.new
				next
			elsif usuario_logado?(linha)
				usuario = Jogador.new(acha_usuario(linha))
				@jogos.last.jogadores[usuario.nome] = usuario
				next
			elsif acha_morte?(linha)
				assassino = acha_assassino(linha)
				morto = acha_morto(linha)
				causa = causa_morte(linha)
				@jogos.last.matou
				@jogos.last.causaMorte[causa] = @jogos.last.causaMorte[causa] +1
				if assassino != "<world>"
					@jogos.last.jogadores[assassino].add_ponto
				else
					@jogos.last.jogadores[morto].dec_ponto
				end
			end
		end
				
	end
	
	def relatorio
		@jogos.each do |jogo|
			puts jogo.imprimir
		end
	end
	
	def ranking
		ranking = Hash.new(0)
		@jogos.each do |jogo|
			jogo.jogadores.map { |key, valor| ranking[key] += valor.pontuacao }
		end
		
		ranking = organizar(ranking)
		puts "Ranking por mortes:\n" + ranking.map { |key, valor| "PLAYER: #{key} #{valor} KILLS\n" }.join("") + "\n"
	end
	
	def organizar(var)
		var.sort_by { |key, valor| valor}.reverse
	end
	
	private
		# define o usuario que se logou
		def acha_usuario(reg)
			reg.match(/((?<=n\\).*?(?=\\t))/)[0]
		end
		
		# encontra quem matou
		def acha_assassino(reg)
			reg.match(/([^:]+).(?=\skilled)/)[0].strip
		end
		
		#encontra quem morreu
		def acha_morto(reg)
			reg.match(/((?<=killed\s).*(?=\sby))/)[0]
		end
		
		# encontra causa da morte
		def causa_morte(reg)
			reg.match(/((?<=by\s).*)/)[0]
		end
		
		# encontra linha indicando um novo jogo iniciado
		def inicio_jogo?(reg)
			reg.match(/InitGame:/) ? true : false
		end
		
		#encontra quando algum usuario entrou
		def usuario_logado?(reg)
			reg.match(/ClientUserinfoChanged:/) ? true : false
		end
		
		# encontra linha indicando o final de um jogo
		def fim_jogo?(reg)
			reg.match(/ShutdownGame:/) ? true : false
		end
		
		# encontra quando alguem morreu
		def acha_morte?(reg)
			reg.match(/Kill:/) ? true : false
		end
end