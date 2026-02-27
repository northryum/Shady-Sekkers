function player_state_free(){
    /// @description Estado livre do jogador (Movimento e Pulo)

    #region Movimentação

    // 1. Lendo os controles do Create de cada jogador
    var _key_left  = keyboard_check(tecla_esquerda);
    var _key_right = keyboard_check(tecla_direita);
    var _key_jump  = keyboard_check(tecla_pulo);
    
    var _move = _key_right - _key_left != 0;

    // 2. Aplicando a Gravidade
    vspd += grav;
    vspd = clamp(vspd, vspd_min, vspd_max);

    // 3. Movimento Horizontal e Troca de Sprites (Chão)
    if (_move) {
        sprite_index = meu_spr_run; 
        move_dir = point_direction(0, 0, _key_right - _key_left, 0);
        move_spd = approach(move_spd, move_spd_max, acc);
    } else {
        sprite_index = meu_spr_idle; 
        move_spd = approach(move_spd, 0, dcc);    
    }

    hspd = lengthdir_x(move_spd, move_dir);

    // Vira o personagem para o lado certo
    if (hspd != 0) {
        x_scale = sign(hspd);
    }

    // 4. Verificação de Chão e Coyote Time
    var _ground = place_meeting(x, y + 1, obj_wall);

    if (_ground) {
        coyote_time = coyote_time_max; // Recarrega o pulo
    } else {
        coyote_time--; // Diminui o tempo de tolerância no ar
        
        // Troca de sprites no ar
        if (vspd < 0) {
            sprite_index = meu_spr_jump;   
        } else if (vspd > 0) {
            sprite_index = meu_spr_fall;
        }
    }

    // 5. O PULO (A parte que estava faltando!)
    if (_key_jump && coyote_time > 0) {
        coyote_time = 0;     // Zera para evitar pulo duplo
        y -= 1;              // O "puxão" para descolar do chão (Evita o bug do Middle Centre)
        vspd = -jump_height; // Joga o personagem para cima
    }

    #endregion
}