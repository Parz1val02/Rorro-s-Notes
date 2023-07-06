# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess
from libqtile import hook
mod = "mod4"
terminal = guess_terminal()
color_barra="#598C87"
fuente_predeterminada="Shure Tech Mono Nerd Font"
tamano_barra=30
tamano_fuente=15
tamano_icono=18
color_actualizaciones = '#699C97'
background_1 ='716b48'
background_2 = '272F22'
background_3 ='320903'
background_4 ='5C8F8A'

foreground_1 = 'ffffff'
dispositvo_red = 'enp0s3'

#funcion para agregar separadores
def separador():
    return widget.Sep(
                    padding=10, linewidth=5, size_percent=75, foreground='FFFFFF'
                )
#funcion para agregar inicio 0 o fin 1 de las barras
def rectangulo(vColor, tipo):
    if tipo==0:
        icono = "" #nf-ple-left_half_circle_thick
    else:
        icono = "" #nf-ple-right_half_circle_thick
    return widget.TextBox(
                    text = icono,
                    fontsize = 28,
                    foreground = vColor,
                    background = color_barra,
                    padding = -3
                )
#funcion para agregar el centro de las barras
def icono(icono, color_grupo):
    return widget.TextBox(
                    text = icono,
                    foreground = 'ffffff',
                    background =  color_grupo,
                    fontsize = tamano_icono+2
    )

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "u", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "i", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "u", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "i", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "u", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "i", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn("alacritty"), desc="Launch terminal"),
    # Open rofi menu
    Key([mod], "m", lazy.spawn("rofi -modi drun -show drun"), desc="Open menu"),
    #Open firefox
    Key([mod], "f", lazy.spawn("firefox"), desc="Open firefox"),
        
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    #Control Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
#pamixer -i 5 #to increase 5%
#pamixer -d 5 #to decrease 5%

    #Brightnessa
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),

    #screenshot
     Key([mod, "shift"], "s", lazy.spawn("scrot"), desc="Screenshot with scrot")
]
#Listado iconos nerd fonts
#1-arch linux nf-linux-archlinux
#2-C nf-custom-c
#3-Vim nf-custom-vim
#4-Firefox nf-dev-firefox
#5-Resistance nf-fa-resistance
#6-Linux nf-dev-linux
#7-nf-fae-playstation
#8-Raspberry pi nf-dev-rasberry_pi  
#9-pokemon nf-mdi-pokeball
groups = [Group(i) for i in [
        '   ','   ','   ','   ','   ','   ', '   ','  ',' 卵 ']]

for i, group in enumerate(groups):
    numberScreen=str(i+1)
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                numberScreen,
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                numberScreen,
                lazy.window.togroup(group.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(group.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        border_focus = 'ffffff',
        border_width=1,
        margin = 10,
        border_normal = '#95C2BF',
        grow_amount = 5
        ),
    layout.Max(border_focus = 'ffffff',
        border_width=1,
        margin = 5,
        border_normal = '#95C2BF'),
    # Try more layouts by unleashing below layouts.
    #layout.Stack(num_stacks=2),
    #layout.Bsp(),
    #layout.Matrix(),
    #layout.MonadTall(),
    #layout.MonadWide()
    #layout.RatioTile(),
    #layout.Tile(),
    #layout.TreeTab(),
    #layout.VerticalTile(),
    #layout.Zoomy(),
]

widget_defaults = dict(
    font=fuente_predeterminada,
    fontsize=tamano_fuente,
    padding=1,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        #wallpaper='~/Pictures/dune-4-1920×1200.jpg',
        #wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.GroupBox(
                    active='FFFFFF',
                    border_width=1,
                    disable_drag=True,
                    fontsize=tamano_icono,
                    highlight_method='line',
                    inactive='000000'
                ),
                separador(),
                widget.Prompt(fontsize=14,font=fuente_predeterminada, foreground='3C3A2B'),
                separador(),
                widget.WindowName(fontsize=14,font=fuente_predeterminada,foreground='3C3A2B'),
                #widget.Chord(
                #    chords_colors={
                #        "launch": ("#ff0000", "#ffffff"),
                #    },
                #    name_transform=lambda name: name.upper(),
                #),
                #widget.TextBox("default config", name="default"),
                #widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(
                    icon_size=tamano_icono,
                    padding=6
                ),
                separador(),
                #grupo1
                rectangulo(background_1,0),
                icono(' ',background_1), # nf-fa-save
                widget.Memory(
                    foreground = foreground_1,
                    background = background_1,
                ),
                rectangulo(background_1,1 ),
                #grupo1    
                separador(),
                #grupo2
                rectangulo(background_2,0),
                #icono(' ',background_2), # nf-mdi-autore
                #widget.CheckUpdates(
                #    background = background_2,
                #    colour_have_updates = color_actualizaciones,
                #    colour_no_updates_ = foreground_1,
                #    no_update_string = '0',
                #    display_format = '{updates}',
                #    update_interval = 1800,
                #    distro = 'Arch_checkupdates'
                #    ),
                icono(' 龍 ', background_2), #nf-mdi-speedometer
                widget.Net(
                    foreground = foreground_1,
                    background = background_2,
                    format = '{down}  {up}  ', #nf-fa-arrow_circle_down nf-fa-arrow_circle_up
                    interface = dispositvo_red,
                    use_bits = 'true'
                ),
                rectangulo(background_2,1 ),
                #grupo 2
                separador(),
                #grupo 3
                rectangulo(background_3,0),
                widget.Clock(
                    background = background_3,
                    foreground = foreground_1,
                    format="%Y-%m-%d %a %I:%M %p"
                ),
                icono('  ', background_3), #nf-fa-volume_up
                #widget.PulseVolume(
                #    foreground = foreground_1,
                #    background = background_3,
                #    limit_max_volume = True,
                #    fontsize = tamano_fuente
                #),
                widget.Volume(
                    background = background_3,
                    foreground = foreground_1,
                    fontsize = tamano_fuente
                ),
                rectangulo(background_3,1 ),
                #grupo 3
                separador(),
                #grupo 4
                rectangulo(background_4,0),
                widget.QuickExit(background = background_4, fontsize = tamano_fuente, foreground = foreground_1),
                rectangulo(background_4,1 ),
                #grupo 4
                separador(),
                #grupo 5
                rectangulo(background_4,0),
                widget.CurrentLayoutIcon(background = background_4, scale = 0.75, foreground = foreground_1),
                widget.CurrentLayout(background = background_4, fontsize = tamano_fuente, foreground = foreground_1),
                rectangulo(background_4,1 ),
                
            ],
            tamano_barra,
            #border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            #border_color=["#522f0f", "000000", "#522f0f", "000000"],  # Borders are magenta
            background=color_barra,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])



