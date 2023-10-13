draw_self();
draw_set(fnt_menu_buttons_small, fa_center, fa_middle, c_white, 1);
draw_text_transformed(x,y - 6,text, 0.4, 0.4, 0);
draw_set(fnt_menu_buttons_small, fa_center, fa_middle, c_yellow, 1);
draw_text_transformed(x,y + 6,obj_hangar_controller.cost, 0.4, 0.4, 0);
