function scr_find_matches(_board)
{
    var found = false;

    // Limpiar marcas
    ds_grid_set_region(
        _board.match_grid,
        0, 0,
        _board.grid_width - 1,
        _board.grid_height - 1,
        false
    );

    // ----- Vertical -----
    for (var c = 0; c < _board.grid_width; c++)
    {
        var count = 1;

        for (var r = 1; r < _board.grid_height; r++)
        {
            var curr = _board.board[# c, r];
            var prev = _board.board[# c, r - 1];

            if (curr != -1 && curr == prev)
            {
                count++;
            }
            else
            {
                if (count >= 3)
                {
                    found = true;
                    for (var k = 0; k < count; k++)
                        _board.match_grid[# c, r - 1 - k] = true;
                }
                count = 1;
            }
        }

        // Final de columna
        if (count >= 3)
        {
            found = true;
            for (var k = 0; k < count; k++)
                _board.match_grid[# c, _board.grid_height - 1 - k] = true;
        }
    }

    // ----- Horizontal -----
    for (var r = 0; r < _board.grid_height; r++)
    {
        var count = 1;

        for (var c = 1; c < _board.grid_width; c++)
        {
            var curr = _board.board[# c, r];
            var prev = _board.board[# c - 1, r];

            if (curr != -1 && curr == prev)
            {
                count++;
            }
            else
            {
                if (count >= 3)
                {
                    found = true;
                    for (var k = 0; k < count; k++)
                        _board.match_grid[# c - 1 - k, r] = true;
                }
                count = 1;
            }
        }

        // Final de fila
        if (count >= 3)
        {
            found = true;
            for (var k = 0; k < count; k++)
                _board.match_grid[# _board.grid_width - 1 - k, r] = true;
        }
    }
	
	// ----- Diagonal \ -----
	for (var c = 0; c < _board.grid_width; c++)
	{
	    for (var r = 0; r < _board.grid_height; r++)
	    {
	        var base = _board.board[# c, r];
	        if (base == -1) continue;

	        var count = 1;
	        var cc = c + 1;
	        var rr = r + 1;

	        while (cc < _board.grid_width &&
	               rr < _board.grid_height &&
	               _board.board[# cc, rr] == base)
	        {
	            count++;
	            cc++;
	            rr++;
	        }

	        if (count >= 3)
	        {
	            found = true;
	            for (var k = 0; k < count; k++)
	            {
	                _board.match_grid[# c + k, r + k] = true;
	            }
	        }
	    }
	}

	// ----- Diagonal / -----
	for (var c = 0; c < _board.grid_width; c++)
	{
	    for (var r = 0; r < _board.grid_height; r++)
	    {
	        var base = _board.board[# c, r];
	        if (base == -1) continue;

	        var count = 1;
	        var cc = c + 1;
	        var rr = r - 1;

	        while (cc < _board.grid_width &&
	               rr >= 0 &&
	               _board.board[# cc, rr] == base)
	        {
	            count++;
	            cc++;
	            rr--;
	        }

	        if (count >= 3)
	        {
	            found = true;
	            for (var k = 0; k < count; k++)
	            {
	                _board.match_grid[# c + k, r - k] = true;
	            }
	        }
	    }
	}

    return found;
}
