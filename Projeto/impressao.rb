load 'Classes/classeAnalise.rb'
teste = Analise.new
puts "Escolha a opção desejada:"
puts "1 - Imprime relatório de cada jogo"
puts "2 - Imprime Ranking por mortes"
puts "3 - Executa as duas funções acima"
print "Opção desejada:"
y = gets
while y.to_i != 1 and y.to_i != 2 and y.to_i != 3 do
	puts "Valor invalido!! Tente novamente:"
	puts "Digite 1 para relatório total e 2 para ranking:"
	y = gets
end
if y.to_i == 1
	teste.relatorio
elsif y.to_i == 2
	teste.ranking
elsif
	teste.relatorio
	teste.ranking
else
	puts "Valor invalido!!"
end