import sys
sys.stdout.flush()

import os
import torch
from diffusers import StableDiffusionPipeline
auth_token = os.getenv("AUTH_TOKEN")

# Paste your prompt here
user_input = "abstract art on stone age"
output_file = f"{user_input}.png"
output_path = os.path.join(os.getcwd(), "generated_images", output_file)

# Define default values
guidance_scale = 8.5

model_id = "CompVis/stable-diffusion-v1-4"
pipe = StableDiffusionPipeline.from_pretrained(model_id, revision="fp16", torch_dtype=torch.float, use_auth_token=auth_token)

# Generate the image
image = pipe(user_input, guidance_scale=guidance_scale).images[0]
image.save(output_path)

print(f"Image generated and saved as {output_file}")
