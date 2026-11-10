draw_self(); 

if (perto) 
{ 
    draw_set_halign(fa_center); 
    draw_set_valign(fa_middle); 

    draw_set_color(c_black); 

    draw_roundrect( 
        x - 55, 
        y - 65, 
        x + 55, 
        y - 25, 
        false 
    ); 

    draw_set_color(c_white); 
    draw_text(x, y - 45, "[E] Entrar"); 

    draw_set_color(c_black);

    draw_roundrect(
        x - 55,
        y - 20,
        x + 55,
        y + 20,
        false
    );

    draw_set_color(c_white);
    draw_text(x, y, "[V] Voltar"); 

    draw_set_halign(fa_left); 
    draw_set_valign(fa_top); 
}