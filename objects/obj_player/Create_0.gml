// --- FÍSICA E MOVIMENTO ---
#region Variaveis - FÍSICA E MOVIMENTO

hspd = 0; // velocidade horizontal
vspd = 0;
grav = 0.3;
vspd_min = -7;
vspd_max = 7;


move_dir = 0;
move_spd = 0;
move_spd_max = 3.0;
acc = 0.3;
dcc = 0.3;

jump_height = 6;
coyote_time_max = 10;
coyote_time = 0;

state = player_state_free;

x_scale = 1;
y_scale = 1;

#endregion
// --- SISTEMA DE GRAVAÇÃO ---
historico_x = [];
historico_y = [];
historico_sprite = [];
historico_escala = [];
historico_frame = [];

frame_atual = 0;
itens_coletados = 0;

// Variáveis de controle (ficarão vazias aqui, os filhos vão preencher)
tecla_direita = noone;
tecla_esquerda = noone;
tecla_pulo = noone;