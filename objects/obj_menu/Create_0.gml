// Nossa nova lista de opções
opcoes = ["1 Jogador", "2 Jogadores", "Opções", "Sair"];

cursor = 0;
opcoes_max = array_length(opcoes);

// Cria a variável global que vai guardar a escolha do jogador
// O padrão será 1 jogador, só por segurança
global.quantidade_jogadores = 1;