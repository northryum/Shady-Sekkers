itens_coletados++;

if (itens_coletados == 3 || itens_coletados == 7) {
    var _sombra = instance_create_layer(x, y, "Instances", obj_sombra);
    _sombra.alvo = id; 
    _sombra.frame_de_leitura = frame_atual; 
    
    // --- CORREÇÃO: Dá o visual atual do jogador para a sombra enquanto ela espera ---
    _sombra.sprite_index = sprite_index;
    _sombra.image_index = image_index;
    _sombra.image_xscale = x_scale; 
}

instance_destroy(other);