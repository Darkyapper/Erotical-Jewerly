var x1 = board_ref.board_x + col * board_ref.cell_size;
var y1 = board_ref.board_y + row * board_ref.cell_size;

// Color según tipo (DEBUG)
var c;

switch (type)
{
    case 0: c = c_aqua;   break;
    case 1: c = c_red;    break;
    case 2: c = c_yellow; break;
    case 3: c = c_green;  break;
    case 4: c = c_purple; break;
    default: c = c_white;
}

draw_set_color(c);

draw_rectangle(
    x1 + 4,
    y1 + 4,
    x1 + board_ref.cell_size - 4,
    y1 + board_ref.cell_size - 4,
    false
);
