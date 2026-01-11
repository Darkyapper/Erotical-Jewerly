draw_set_color(c_white);
draw_set_alpha(1);

/*draw_text(20, 20, "SCORE");
draw_text(20, 40, string(score));
*/
draw_text(board_x + grid_width * cell_size + 20, board_y, "SCORE");
draw_text(board_x + grid_width * cell_size + 20, board_y + 20, string(score));

if (combo_timer > 0)
{
    draw_set_color(c_yellow);
    draw_text(
        20,
        70,
        "COMBO x" + string(combo_display)
    );
}


/*if (combo > 1)
{
    draw_set_color(c_yellow);
    draw_text(
        board_x + grid_width * cell_size + 20,
        board_y + 50,
        "COMBO x" + string(combo)
    );
}*/
