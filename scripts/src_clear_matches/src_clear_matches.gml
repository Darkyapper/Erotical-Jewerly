function scr_clear_matches(_board)
{
    var removed = false;

    for (var c = 0; c < _board.grid_width; c++)
    {
        for (var r = 0; r < _board.grid_height; r++)
        {
            if (_board.match_grid[# c, r])
            {
                _board.board[# c, r] = -1;
                removed = true;
            }
        }
    }

    return removed;
}
