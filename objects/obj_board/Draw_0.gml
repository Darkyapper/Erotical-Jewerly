draw_set_color(c_white);

// Dibujar las celdas
for (var c = 0; c < grid_width; c++)
{
    for (var r = 0; r < grid_height; r++)
    {
        var x1 = board_x + c * cell_size;
        var y1 = board_y + r * cell_size;

        draw_rectangle(
            x1,
            y1,
            x1 + cell_size,
            y1 + cell_size,
            false
        );
    }
}

// Dibujar gemas fijas
for (var c = 0; c < grid_width; c++)
{
    for (var r = 0; r < grid_height; r++)
    {
        if (board[# c, r] != -1)
        {
            var x1 = board_x + c * cell_size;
            var y1 = board_y + r * cell_size;

            var t = board[# c, r];
			var colr;

			switch (t)
			{
			    case 0: colr = c_aqua;   break;
			    case 1: colr = c_red;    break;
			    case 2: colr = c_yellow; break;
			    case 3: colr = c_green;  break;
			    case 4: colr = c_purple; break;
			    default: colr = c_white;
			}

			draw_set_color(colr);

            draw_rectangle(
                x1 + 4,
                y1 + 4,
                x1 + cell_size - 4,
                y1 + cell_size - 4,
                false
            );
        }
    }
}

if (game_state == GAME_OVER)
{
    draw_set_color(c_red);
    draw_text(
        board_x,
        board_y - 30,
        "GAME OVER"
    );
}

#region DEBUG
// DEBUG: marcar matches
for (var c = 0; c < grid_width; c++)
{
    for (var r = 0; r < grid_height; r++)
    {
        if (match_grid[# c, r])
        {
            var x1 = board_x + c * cell_size;
            var y1 = board_y + r * cell_size;

            draw_set_color(c_white);
            draw_rectangle(
                x1 + 10,
                y1 + 10,
                x1 + cell_size - 10,
                y1 + cell_size - 10,
                false
            );
        }
    }
}


#endregion