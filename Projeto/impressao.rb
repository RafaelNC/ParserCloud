load 'Classes/classeAnalise.rb'
teste = Analise.new
puts "Digite 1 para relatório total e 2 para ranking:"
y = gets
while y.to_i != 1 and y.to_i != 2 do
	puts "Valor invalido!! Tente novamente:"
	puts "Digite 1 para relatório total e 2 para ranking:"
	y = gets
end
if y.to_i == 1
	teste.relatorio
elsif y.to_i == 2
	teste.ranking
else
	puts "Valor invalido!!"
end