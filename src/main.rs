use std::{env, process::Command};
// use std::path::Path;

fn main() {
    // Get the current working directory
    if let Ok(current_dir) = env::current_dir() {
        // Define the filenames you want to run (e.g., "python_script.py" and "js_script.js")
        let python_script = "main.py";
        let js_script = "js_script.js";

        // Create full paths by joining with the current working directory
        let python_script_path = current_dir.join(python_script);
        let js_script_path = current_dir.join(js_script);

        // Run the Python script
        let python_output = Command::new("python3")
            .arg(&python_script_path)
            .output()
            .expect("Failed to execute Python script");

        if !python_output.status.success() {
            let stderr = String::from_utf8_lossy(&python_output.stderr);
            eprintln!("Error running Python script: {}", stderr);
            return;
        }

        let python_stdout = String::from_utf8_lossy(&python_output.stdout);
        println!("Python script output:\n{}", python_stdout);

        // Run the JavaScript (Node.js) script
        let js_output = Command::new("node")
            .arg(&js_script_path)
            .output()
            .expect("Failed to execute JavaScript (Node.js) script");

        if !js_output.status.success() {
            let stderr = String::from_utf8_lossy(&js_output.stderr);
            eprintln!("Error running JavaScript (Node.js) script: {}", stderr);
            return;
        }

        let js_stdout = String::from_utf8_lossy(&js_output.stdout);
        println!("JavaScript (Node.js) script output:\n{}", js_stdout);
    } else {
        eprintln!("Error getting current working directory");
    }
}
