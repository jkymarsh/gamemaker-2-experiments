/// @description Enemy pre-lunge state
/// enemy_state_prelunge();

// pause for random amount of time before moving to real lunge

if (state_new) {
  vx = 0;
  vy = 0;
  //tempAccel = groundAccel;
  //tempFric  = groundFric;
  sprite_state = "preLunge";
  image_blend = c_yellow;
  // TODO: 0 makes the sprite literally disappear
  facing = sign(obj_player.x - x);
  alarm[2] = 60;
  
  with (attackBox)
    instance_destroy();
}




if (alarm[2] <= 0) {
  state_switch("Lunge");
}




if (!collision_line(x - 200, y, x + 200, y, obj_player, false, true)) {
  state_switch("Idle");
}

if (!onGround) {
  state_switch("Air");
}
