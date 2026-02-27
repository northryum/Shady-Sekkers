
state();

// --- EFEITO PAC-MAN (Wrap) ---
// Se sair pela direita, volta pela esquerda e vice-versa
if (x < 0) {
    x = room_width;
} else if (x > room_width) {
    x = 0;
}

// --- GRAVAÇÃO DOS MOVIMENTOS ---
array_push(historico_x, x);
array_push(historico_y, y);
array_push(historico_sprite, sprite_index);
array_push(historico_frame, image_index); // Salva o movimento das pernas/braços!
array_push(historico_escala, x_scale);

frame_atual++;


// --- SISTEMA DE MORTE ---
var _inst_sombra = instance_place(x, y, obj_sombra);

if (_inst_sombra != noone) {
    // Agora sim, ele só morre se a sombra estiver ativa
    if (_inst_sombra.ativo == true) {
        show_debug_message("Game Over! A sombra te pegou!");
        room_restart();
    }
}