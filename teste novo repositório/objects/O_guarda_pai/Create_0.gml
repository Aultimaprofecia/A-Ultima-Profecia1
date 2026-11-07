

// ESTADO
estado = 0;

// VELOCIDADE
vel = 2;

// DIREÇÃO
direcao = 3;

// DISTÂNCIA DA PATRULHA
distancia_patrulha = 100;

// POSIÇÃO INICIAL
x_inicial = x;
y_inicial = y;

// VISÃO
distancia_visao = 400;
// ==============================
// SISTEMA DE DESPISTE
// ==============================

tempo_procurando = 2;
tempo_max_procurando = room_speed * 3;

ultimo_x = x;
ultimo_y = y;

estado = 0;

// 0 = patrulhando
// 1 = perseguindo
// 2 = procurando


etnia = irandom(2);

switch (etnia)
{
    case 0:
        sprite_index = S_soldado2;
        break;

    case 1:
        sprite_index = S_soldado3;
        break;

    case 2:
        sprite_index = S_soldado7;
        break;
}