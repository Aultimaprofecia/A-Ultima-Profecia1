
 // ==========================================
// DANO DO GUARDA
// ==========================================

var hud = instance_find(O_vidas, 0);
var jogador = instance_find(O_pai, 0);

if (instance_exists(hud))
{
    if (!hud.invulneravel && hud.vidas > 0)
    {
        hud.vidas -= 1;
        hud.invulneravel = true;

        // 2 segundos de imunidade
        hud.alarm[0] = room_speed * 2;

        if (hud.vidas <= 0)
        {
            hud.vidas = 0;

            if (instance_exists(jogador))
            {
                jogador.morto = true;
            }
        }
    }
}
