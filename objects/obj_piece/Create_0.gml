// Posición base de la pieza (gem inferior)
col = 2;
row = 0;

// Velocidades de caída
fall_delay_normal = 60;  // caída base (ajústala a gusto)
fall_delay_fast   = 5;   // caída rápida

fall_delay = fall_delay_normal;
fall_timer = 0;


// Referencia al tablero
board_ref = instance_find(obj_board, 0);

// Tipos de gemas (por ahora fijos)
types = [
    irandom(4),
    irandom(4),
    irandom(4)
];


// Crear las 3 gemas
gems = array_create(3);

for (var i = 0; i < 3; i++)
{
    gems[i] = instance_create_layer(0, 0, "Instances", obj_gem);
    gems[i].type = types[i];
}

is_gameover_piece = false;
