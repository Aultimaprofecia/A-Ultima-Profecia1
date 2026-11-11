

var distancia = point_distance(x, y, O_pai.x, O_pai.y);

if (distancia < 60)
{
    if (keyboard_check_pressed(ord("E")))
    {
        coletada = true;
        global.chave_coletada = true;
global.chave_room = room;

  instance_create_layer(x, y, "Instances", O_not4);
        instance_destroy();
    }
}