if (is_gameover_piece)
{
    // Solo sincronizar posición visual
    for (var i = 0; i < 3; i++)
    {
        gems[i].col = col;
        gems[i].row = row + i;
        gems[i].type = types[i];
    }

    exit;
}

if (board_ref.game_state == board_ref.GAME_OVER)
{
    instance_destroy();
    exit;
}

#region Movimiento Lateral
var move = 0;

if (keyboard_check_pressed(vk_left))  move = -1;
if (keyboard_check_pressed(vk_right)) move =  1;

if (move != 0)
{
    var can_move = true;

    for (var i = 0; i < 3; i++)
    {
        var check_col = col + move;
        var check_row = row + i;

        // Limite del tablero
        if (check_col < 0 || check_col >= board_ref.grid_width)
        {
            can_move = false;
            break;
        }

        // Colisión con gemas fijas
        if (board_ref.board[# check_col, check_row] != -1)
        {
            can_move = false;
            break;
        }
    }

    if (can_move)
    {
        col += move;
    }
}
#endregion

#region Rotacion
if (keyboard_check_pressed(vk_up))
{
    var temp = types[2];
    types[2] = types[1];
    types[1] = types[0];
    types[0] = temp;
}

#endregion

#region Caida

// Caída rápida (soft drop)
if (keyboard_check(vk_down))
{
    fall_delay = fall_delay_fast;
}
else
{
    fall_delay = fall_delay_normal;
}


fall_timer++;

if (fall_timer >= fall_delay)
{
    fall_timer = 0;

    var can_fall = true;

    for (var i = 0; i < 3; i++)
    {
        var check_row = row + i + 1;

        if (check_row >= board_ref.grid_height ||
            board_ref.board[# col, check_row] != -1)
        {
            can_fall = false;
            break;
        }
    }

    if (can_fall)
    {
        row++;
    }
    else
    {
        // Fijar gemas
        for (var i = 0; i < 3; i++)
        {
            board_ref.board[# col, row + i] = types[i];
            instance_destroy(gems[i]);
        }

		board_ref.resolving = true;
        board_ref.active_gem = noone;
        instance_destroy();
        exit; // CLAVE
    }
}

// Sincronizar posicion si la pieza sigue viva
for (var i = 0; i < 3; i++)
{
    gems[i].col = col;
    gems[i].row = row + i;
	gems[i].type = types[i];
}
#endregion
