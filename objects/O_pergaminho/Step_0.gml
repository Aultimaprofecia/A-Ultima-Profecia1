

var distancia = point_distance(x, y, O_pai.x, O_pai.y);

perto = distancia < 40;

if (perto)
{
    if (keyboard_check_pressed(ord("E")))
    {
        var mais_proximo = instance_nearest(O_pai.x, O_pai.y, O_pergaminho);

        if (mais_proximo == id)
        {
            // Verifica se este pergaminho já foi coletado
            if (!array_contains(global.pergaminhos_coletados, chave))
            {
                global.pergaminhos += 1;

                array_push(global.pergaminhos_coletados, chave);

                instance_create_layer(x, y, "Instances", O_not);

                instance_destroy();
            }
        }
    }
}