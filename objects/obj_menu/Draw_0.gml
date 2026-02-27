// --- CONFIGURAÇÕES GERAIS ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _meio_x = room_width / 2;

// --- DESENHANDO O TÍTULO (SHADY SEEKERS) ---
// Vamos usar laranja/dourado para lembrar o estilo da imagem
draw_set_color(make_color_rgb(230, 140, 50)); 

// Usamos draw_text_transformed para deixar o texto bem maior (escala 3x)
draw_text_transformed(_meio_x, 150, "SHADY SEEKERS", 3, 3, 0);


// --- DESENHANDO OS BOTÕES ---
var _y_inicial = 350; // Onde o primeiro botão começa (mais para baixo)
var _espaco = 80;     // Distância entre um botão e outro
var _largura_botao = 300;
var _altura_botao = 50;

for (var _i = 0; _i < opcoes_max; _i++) {
    
    var _y_atual = _y_inicial + (_i * _espaco);
    
    // Coordenadas da caixa do botão
    var _x1 = _meio_x - (_largura_botao / 2);
    var _y1 = _y_atual - (_altura_botao / 2);
    var _x2 = _meio_x + (_largura_botao / 2);
    var _y2 = _y_atual + (_altura_botao / 2);
    
    // 1. Cor do fundo do botão (muda se estiver selecionado)
    if (cursor == _i) {
        draw_set_color(make_color_rgb(120, 120, 120)); // Cinza mais claro se selecionado
    } else {
        draw_set_color(make_color_rgb(60, 60, 60));    // Cinza bem escuro se não
    }
    
    // Desenha o preenchimento do botão (roundrect faz cantos levemente arredondados)
    draw_roundrect(_x1, _y1, _x2, _y2, false);
    
    // 2. Cor da borda do botão
    draw_set_color(c_white);
    draw_roundrect(_x1, _y1, _x2, _y2, true);
    
    // 3. Texto da opção
    if (cursor == _i) {
        draw_set_color(c_yellow); // Texto amarelo para dar destaque
    } else {
        draw_set_color(c_white);  // Texto branco normal
    }
    
    draw_text(_meio_x, _y_atual, opcoes[_i]);
}

// Reseta a cor para branco no final para não bugar outros desenhos
draw_set_color(c_white);