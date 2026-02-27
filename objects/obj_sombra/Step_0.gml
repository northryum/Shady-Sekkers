// Se o jogador que a criou ainda existir
if (instance_exists(alvo)) {
    
    // Verifica se o frame que ela quer ler já foi gravado pelo jogador
    if (frame_de_leitura < array_length(alvo.historico_x)) {
        
        // Atualiza a posição e a imagem copiando o passado do jogador
        x = alvo.historico_x[frame_de_leitura];
        y = alvo.historico_y[frame_de_leitura];
        sprite_index = alvo.historico_sprite[frame_de_leitura];
        image_xscale = alvo.historico_escala[frame_de_leitura];
        
        // Avança o frame da sombra para o próximo passo
        frame_de_leitura++;
    }
}

// --- FIM DE JOGO (COLISÃO COM O JOGADOR) ---
// Se a sombra encostar no dono dela, game over!
if (place_meeting(x, y, alvo)) {
    show_message("Game Over! Você colidiu com sua sombra.");
    game_restart(); // Ou vá para uma tela de Game Over
}