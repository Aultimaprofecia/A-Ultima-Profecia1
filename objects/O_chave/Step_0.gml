

var distancia = point_distance(x, y, O_pai.x, O_pai.y);

if (distancia < 60)
{
    if (keyboard_check_pressed(ord("E")))
    {
        coletada = true;
        global.chave_coletada = true;
global.chave_room = room;
        instance_destroy();
    }
}