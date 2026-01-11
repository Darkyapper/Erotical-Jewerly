function scr_apply_gravity(_board)
{
    for (var c = 0; c < _board.grid_width; c++)
    {
        for (var r = _board.grid_height - 2; r >= 0; r--)
        {
            if (_board.board[# c, r] != -1)
            {
                var rr = r;

                while (rr + 1 < _board.grid_height &&
                       _board.board[# c, rr + 1] == -1)
                {
                    _board.board[# c, rr + 1] = _board.board[# c, rr];
                    _board.board[# c, rr] = -1;
                    rr++;
                }
            }
        }
    }
}
