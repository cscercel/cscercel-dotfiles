-- Look and feel configuration

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 1,
        extend_border_grab_area = 10,
        resize_on_border = false,
        col = {
            active_border = {
                colors = { CACHYMRED, CACHYMRED },
                angle = 45,
            },
            inactive_border = CACHYBLANK,
        },
    },
    group = {
        col = {
            border_active = CACHYMRED,
            border_inactive = CACHYBLANK,
            border_locked_active = CACHYDYELLOW,
            border_locked_inactive = CACHYBLANK,
        },
        groupbar = {
            col = {
                active = CACHYMRED,
                inactive = CACHYBLANK,
                locked_active = CACHYDYELLOW,
                locked_inactive = CACHYBLANK,
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 5,
        active_opacity = 1,
        inactive_opacity = 1,
        fullscreen_opacity = 1,
        blur = {
            enabled = false,
        },
    },
    cursor = {
        inactive_timeout = 3,
        hide_on_key_press = true,
    },
})
