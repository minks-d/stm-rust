#![deny(warnings)]
#![deny(unsafe_code)]
#![no_main]
#![no_std]

use hal::prelude::*;
use hal::stm32;
use stm32g4xx_hal as hal;

use cortex_m_rt::entry;

use panic_halt as _;

#[entry]
fn main() -> ! {
    let dp = stm32::Peripherals::take().expect("cannot take peripherals");
    let mut rcc = dp.RCC.constrain();

    let gpioa = dp.GPIOA.split(&mut rcc);
    let mut led = gpioa.pa5.into_push_pull_output();

    loop {
        for _ in 0..10_000_000 {
            let _ = led.set_low();
        }

        for _ in 0..10_000_000 {
            let _ = led.set_high();
        }
    }
}
