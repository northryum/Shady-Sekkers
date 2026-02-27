/// @description Acontece a todo momento depois do step
// Essa linha é uma anotação que descreve que o código é executado continuamente após cada "step" (passo do jogo).

#region Colisão
// Início de uma região chamada "Colisão" que agrupa o código relacionado à detecção de colisões.

// A função `repeat(abs(hspd))` indica que o código dentro do bloco será repetido o número de vezes igual ao valor absoluto da variável `hspd` (horizontal speed - velocidade horizontal). Isso faz com que o objeto se mova um passo de cada vez na direção horizontal, até o valor de `hspd`.

repeat(abs(hspd)) {
    
    // A função `place_meeting(x + sign(hspd), y, obj_wall)` verifica se há colisão com a parede (`obj_wall`) na direção horizontal, no próximo passo de movimento.
    if (place_meeting(x + sign(hspd), y, obj_wall)) {
        // Se há uma colisão, verifica se há um espaço acima (y-1) para o objeto subir.
        if (!place_meeting(x + sign(hspd), y - 1, obj_wall)) {
            y--; // Move o objeto um pixel para cima.
        }
    } else {
        // Se não houver colisão na direção horizontal, verifica se há espaço abaixo (y+1) para o objeto descer.
        if (!place_meeting(x + sign(hspd), y + 1, obj_wall)) {
            // Se houver espaço dois pixels abaixo (y+2), move o objeto para baixo.
            if (place_meeting(x + sign(hspd), y + 2, obj_wall)) {
                y++; // Move o objeto um pixel para baixo.
            }
        }
    }

    // Verifica novamente se há colisão após os ajustes verticais.
    if (place_meeting(x + sign(hspd), y, obj_wall)) {
        hspd = 0; // Zera a velocidade horizontal ao encontrar uma parede.
        break; // Sai do laço repeat.
    } else {
        x += sign(hspd); // Move o objeto um pixel na direção horizontal.
    }
}

// O bloco a seguir lida com o movimento vertical, repetindo o processo para a velocidade vertical (`vspd`).

repeat(abs(vspd)) {
    // Verifica colisão na direção vertical (y+sign(vspd)).
    if (place_meeting(x, y + sign(vspd), obj_wall)) {
        vspd = 0; // Zera a velocidade vertical se houver colisão.
        break; // Sai do laço repeat.
    } else {
        y += sign(vspd); // Move o objeto um pixel na direção vertical.
    }
}

#endregion
// Fim da região de colisão.
