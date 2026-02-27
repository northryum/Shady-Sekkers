// Teclas para subir, descer e confirmar (aceita setas ou WASD)
var _up    = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _down  = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// Se apertar para cima, o cursor diminui
if (_up) {
    cursor--;
    // Se o cursor passar do topo, ele vai para a última opção (efeito loop)
    if (cursor < 0) cursor = opcoes_max - 1;
}

// Se apertar para baixo, o cursor aumenta
if (_down) {
    cursor++;
    // Se passar da última opção, volta para o topo
    if (cursor >= opcoes_max) cursor = 0;
}

// Se apertar Enter, ele executa a ação baseada em onde o cursor está
if (_enter) {
    switch(cursor) {
        case 0: // 1 Jogador
            global.quantidade_jogadores = 1; // Salva a escolha
            room_goto_next();                // Vai pra fase
            break;
            
        case 1: // 2 Jogadores
            global.quantidade_jogadores = 2; // Salva a escolha
            room_goto_next();                // Vai pra fase
            break;
            
        case 2: // Opções
            show_message("Menu de Opções em construção!"); 
            break;
            
        case 3: // Sair
            game_end(); 
            break;
    }
}