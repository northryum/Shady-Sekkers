itens_coletados++;

// Verifica se atingiu a meta para criar uma sombra (ex: 3 itens, 7 itens)
var _criar_sombra = false;
if (itens_coletados == 3) _criar_sombra = true;
if (itens_coletados == 7) _criar_sombra = true;

if (_criar_sombra) {
    // Cria a sombra na posição atual do jogador/item
    var _sombra = instance_create_layer(x, y, "Instances", obj_sombra);
    
    // Diz para a sombra quem ela deve copiar
    _sombra.alvo = id; 
    
    // Diz para a sombra em qual momento do tempo ela deve começar a imitar
    _sombra.frame_de_leitura = frame_atual; 
}

// Destrói o item coletado
instance_destroy(obj_item);