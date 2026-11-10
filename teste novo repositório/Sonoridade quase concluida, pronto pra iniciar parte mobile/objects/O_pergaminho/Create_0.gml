coletado = false;

chave = string(room) + "_" + string(x) + "_" + string(y);

if (!variable_global_exists("pergaminhos"))
{
    global.pergaminhos = 0;
}

if (!variable_global_exists("pergaminhos_coletados"))
{
    global.pergaminhos_coletados = [];
}