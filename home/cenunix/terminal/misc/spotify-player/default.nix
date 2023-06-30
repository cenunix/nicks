{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # spotify command line interface
    spotify-player
  ];
  age.secrets.spotify-player = {
    file = ../../../../../secrets/spotify-player.age;
    owner = "cenunix";
    mode = "700";
    group = "users";
  };
  client_id = "${pkgs.coreutils}/bin/head -1 /run/agenix/spotify-player";
  home.file.".config/spotify-player/app.toml".text = ''
    client_id = ${client_id}
    app_refresh_duration_in_ms = 32
    playback_refresh_duration_in_ms = 0
    cover_image_refresh_duration_in_ms = 2000
    track_table_item_max_len = 32
    enable_media_control = true
    default_device = "spotify-player"
    play_icon = "\u23f8"
    pause_icon = "\u25b6"
    cover_img_length = 9
    cover_img_width = 5
    playback_window_width = 6
    [device]
    name = "spotify-player"
    device_type = "speaker"
    volume = 100
    bitrate = 320
    audio_cache = false
  '';
}
