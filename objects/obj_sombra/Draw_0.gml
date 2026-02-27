// --- DESENHO DA SOMBRA (Visual Final) ---

// Define a transparência: 70% quando ativa, 30% quando fantasma (no spawn)
var _alpha = ativo ? 0.7 : 0.3; 

// Define a cor da silhueta (pode mudar c_red para c_black ou c_fuchsia)
var _cor = c_red; 

// Desenha o sprite copiando a animação e o lado que o jogador olhou
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, _cor, _alpha);