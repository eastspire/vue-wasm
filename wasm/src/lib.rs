extern crate wasm_bindgen;

use wasm_bindgen::prelude::*;

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = console)]
    fn log(s: &str);
}

#[wasm_bindgen]
pub fn console(str: &str) {
    // 调用JS console.log方法
    log(str);
}

#[cfg(test)]
mod tests {
    use super::*;
    use wasm_bindgen_test::*;

    // 配置 wasm-bindgen-test 运行在浏览器环境中
    wasm_bindgen_test_configure!(run_in_browser);

    #[test]
    #[wasm_bindgen_test]
    fn console_log() {
        console("hello world");
    }
}
