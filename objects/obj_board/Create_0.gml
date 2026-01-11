// Estados del juego
GAME_PLAY = 0;
GAME_OVER = 1;

game_state = GAME_PLAY;

// Dimensiones del tablero
grid_width  = 6;
grid_height = 13;

resolving = false;

// Tamaño de cada celda (en píxeles)
cell_size = 32;

// Posición del tablero en pantalla
board_x = 100;
board_y = 40;

// Crear el grid lógico
board = ds_grid_create(grid_width, grid_height);
ds_grid_set_region(board, 0, 0, grid_width - 1, grid_height - 1, -1);

active_gem = noone;
depth = 100;

match_grid = ds_grid_create(grid_width, grid_height);
ds_grid_set_region(match_grid, 0, 0, grid_width - 1, grid_height - 1, false);
