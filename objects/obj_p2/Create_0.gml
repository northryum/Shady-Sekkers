event_inherited(); 
// Se o jogador escolheu apenas 1 jogador lá no menu...
if (global.quantidade_jogadores == 1) {
    // ...o Jogador 2 se auto-destrói antes mesmo de aparecer na tela!
    instance_destroy(); 
}
tecla_direita  = vk_right;
tecla_esquerda = vk_left;
tecla_pulo     = vk_up;

// --- SPRITES DO PLAYER 2 ---
meu_spr_idle = spr_p2_idle; // Coloque o nome do seu sprite parado aqui
meu_spr_run  = spr_p2_run;  // Correndo
meu_spr_jump = spr_p2_jump; // Pulando
meu_spr_fall = spr_p2_fall; // Caindo