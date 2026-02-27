// A sombra SÓ se move e SÓ lê o histórico se já estiver ativa!
if (ativo == true && instance_exists(alvo)) {
    
    if (frame_de_leitura < array_length(alvo.historico_x)) {
        x = alvo.historico_x[frame_de_leitura];
        y = alvo.historico_y[frame_de_leitura];
        sprite_index = alvo.historico_sprite[frame_de_leitura];
        image_index = alvo.historico_frame[frame_de_leitura]; 
        image_xscale = alvo.historico_escala[frame_de_leitura];
        
        frame_de_leitura++; // Avança o "filme"
    }
}

// Wrap (Efeito Pac-Man)
if (x < 0) x = room_width;
if (x > room_width) x = 0;