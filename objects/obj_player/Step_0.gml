// 1. Receber os comandos do jogador
var _direita = keyboard_check(tecla_direita);
var _esquerda = keyboard_check(tecla_esquerda);
var _pulo = keyboard_check_pressed(tecla_pulo);

// 2. Calcular o movimento horizontal (1 se for direita, -1 se for esquerda, 0 se nenhum ou os dois)
var _movimento = _direita - _esquerda;
hsp = _movimento * spd;

// 3. Aplicar gravidade
vsp += grv;

// 4. Pulo (Só pula se estiver tocando o chão)
if (place_meeting(x, y + 1, obj_chao)) {
    if (_pulo) {
        vsp = jump_spd;
    }
}

// 5. Colisão Horizontal
if (place_meeting(x + hsp, y, obj_chao)) {
    // Aproxima o jogador do bloco pixel por pixel até encostar
    while (!place_meeting(x + sign(hsp), y, obj_chao)) {
        x += sign(hsp);
    }
    hsp = 0; // Zera a velocidade para não atravessar a parede
}
x += hsp;

// 6. Colisão Vertical
if (place_meeting(x, y + vsp, obj_chao)) {
    // Aproxima o jogador do chão/teto pixel por pixel
    while (!place_meeting(x, y + sign(vsp), obj_chao)) {
        y += sign(vsp);
    }
    vsp = 0; // Zera a velocidade (para de cair ou bater a cabeça)
}
y += vsp;

// 7. Virar o Sprite na direção certa
if (hsp != 0) {
    image_xscale = sign(hsp);
}

// --- EFEITO PAC-MAN (Wrap) ---
// Se sair pela direita, volta pela esquerda e vice-versa
if (x < 0) {
    x = room_width;
} else if (x > room_width) {
    x = 0;
}

// =======================================================
// AQUI EMBIAXO ENTRA O CÓDIGO DE GRAVAÇÃO DO PASSO ANTERIOR
// array_push(historico_x, x);
// ... etc
// =======================================================

// --- SUA LÓGICA DE MOVIMENTO VEM AQUI ---

// Sistema de passar pro outro lado da tela (Wrap Horizontal)
if (x < 0) {
    x = room_width;
} else if (x > room_width) {
    x = 0;
}

// --- GRAVAÇÃO DOS MOVIMENTOS ---
// Salva as informações do frame atual nos arrays
array_push(historico_x, x);
array_push(historico_y, y);
array_push(historico_sprite, sprite_index);
array_push(historico_escala, image_xscale);

// Avança o contador de tempo do jogador
frame_atual++;

// --- SISTEMA DE MORTE ---
// Se o jogador encostar em QUALQUER sombra, é Game Over
if (place_meeting(x, y, obj_sombra)) {
    show_message("Game Over! A sombra te pegou!");
    
    // Reinicia a fase (ou você pode usar instance_destroy() se preferir)
    room_restart(); 
}