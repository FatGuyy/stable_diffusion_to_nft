use reqwest::header::{HeaderMap, HeaderValue};
use reqwest::Client;
use serde::{Deserialize, Serialize};
// use std::collections::HashMap;
use std::error::Error;

#[derive(Serialize)]
struct RequestData {
    prompt: String,
    formats: String,
}

#[derive(Deserialize)]
struct ResponseData {
    // Define the structure of the response data if needed
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    // Set your API secret/token
    let api_secret = "OGEwNWMxMTk0ZDQ2YjRlYTU1ZWU4MmFmOGM1NzBiNjU3ZjUxNDA5ZjplODIxMzNkMC1mMDMxLTcwNzgtNGUxOS1jOGRhNThiZGE2MmM=";

    // Define the request data
    let request_data = RequestData {
        prompt: "space dog floating --economy".to_string(),
        formats: "PNG".to_string(),
    };

    // Create a client with custom headers (including authorization)
    let mut headers = HeaderMap::new();
    headers.insert(
        "Authorization",
        HeaderValue::from_str(&format!("Bearer {}", api_secret))?,
    );

    // Make the POST request
    let response = make_post_request(
        "https://prod.omnibridge.io/imagine",
        &request_data,
        &headers,
    )
    .await?;

    // Process the response as needed
    let response_text = response.text().await?;
    println!("Response: {:?}", response_text);

    Ok(())
}

async fn make_post_request<T>(
    url: &str,
    data: &T,
    headers: &HeaderMap,
) -> Result<reqwest::Response, Box<dyn Error>>
where
    T: Serialize,
{
    let client = Client::new();

    let response = client
        .post(url)
        .headers(headers.clone())
        .json(data)
        .send()
        .await?;

    Ok(response)
}
