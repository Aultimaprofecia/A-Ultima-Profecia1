
 // ==========================================
// IDENTIFICAR O OBJETIVO ATUAL
// ==========================================

var objetivo_atual = 1;
var sprite_objetivo = S_hud_objetivo1;

// Valores atuais dos contadores
var qtd_pergaminhos = 0;
var qtd_madeiras = 0;

if (variable_global_exists("pergaminhos"))
{
    qtd_pergaminhos = global.pergaminhos;
}

if (variable_global_exists("madeiras_coletadas"))
{
    qtd_madeiras = global.madeiras_coletadas;
}

// ==========================================
// OBJETIVO 1: PERGAMINHOS E MADEIRAS
// ==========================================

if (qtd_pergaminhos >= 10 && qtd_madeiras >= 15)
{
    objetivo_atual = 2;
    sprite_objetivo = S_hud_objetivo2;
}

// ==========================================
// OBJETIVO 2 CONCLUÍDO: ENCONTRAR O LIVRO
// ==========================================

if (variable_global_exists("livro_encontrado"))
{
    if (global.livro_encontrado)
    {
        objetivo_atual = 3;
        sprite_objetivo = S_hud_objetivo3;
    }
}

// ==========================================
// OBJETIVO 3 CONCLUÍDO: PEGAR A CHAVE
// ==========================================

if (variable_global_exists("chave_coletada"))
{
    if (global.chave_coletada)
    {
        objetivo_atual = 4;
        sprite_objetivo = S_hud_objetivo4;
    }
}


 // ==========================================
// DESENHAR PAINEL DO OBJETIVO EM TAMANHO MAIOR
// ==========================================


var hud_x = 0;
var hud_y = 0;
var largura_hud = 500;

var altura_hud = largura_hud
    * sprite_get_height(sprite_objetivo)
    / sprite_get_width(sprite_objetivo);

draw_sprite_stretched_ext(
    sprite_objetivo,
    0,
    hud_x,
    hud_y,
    largura_hud,
    altura_hud,
    c_white,
    1
);



// ==========================================
// CONTADORES DO PRIMEIRO OBJETIVO
// ==========================================
if (objetivo_atual == 1)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);

    // Quantidade de pergaminhos
    draw_text_transformed(
        hud_x + 190,
        hud_y + 270,
        string(qtd_pergaminhos),
        1.2,
        1.2,
        0
    );

    // Quantidade de madeiras
    draw_text_transformed(
        hud_x + 270,
        hud_y + 270,
        string(qtd_madeiras),
        1.2,
        1.2,
        0
    );
}

// Restaurar configurações de desenho
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
