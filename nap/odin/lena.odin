package main

import "shared:lena"

main :: proc() {
    lena.init("lena", 128, 128)
    defer lena.destroy()

    for delta_time in lena.step() {
        lena.clear_screen(9)
        lena.draw_text("Hello, |world|!", 10, 10)
    }
}
