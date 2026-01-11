if (game_state != GAME_PLAY) exit;

if (resolving)
{
    // 1. Limpiar marcas previas
    ds_grid_set_region(match_grid, 0, 0, grid_width-1, grid_height-1, false);

    // 2. Buscar matches
    var found = scr_find_matches(board, match_grid);

    if (found)
    {
		combo++;
		
        // 3. Eliminar
        var removed = scr_clear_matches(board, match_grid);
		
		score += removed * 10 * combo;

        // 4. Gravedad
        scr_apply_gravity(board);
    }
    else
    {
		combo = 0; 
        // 5. Ya no hay nada que resolver
        resolving = false;
    }

    exit; // ⬅️ CLAVE: no hacer nada más este frame
}

if (!resolving && (active_gem == noone || !instance_exists(active_gem)))
{
    var spawn_col = 2;
    var spawn_row = 0;
    var blocked = false;

    for (var i = 0; i < 3; i++)
    {
        if (board[# spawn_col, spawn_row + i] != -1)
        {
            blocked = true;
            break;
        }
    }

    active_gem = instance_create_layer(
	    0, 0,
	    "Instances",
	    obj_piece
	);

	if (blocked)
	{
	    active_gem.is_gameover_piece = true;
	    game_state = GAME_OVER;
	}

}
