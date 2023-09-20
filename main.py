import torch
from diffusers import StableDiffusionPipeline

pipe = StableDiffusionPipeline.from_pretrained("CompVis/stable-diffusion-v1-4", torch_dtype=torch.float16)
# modelid = "CompVis/stable-diffusion-v1-4"
# pipe = StableDiffusionPipeline.from_pretrained(modelid, revision="fp16", torch_dtype=torch.float, use_auth_token=auth_token) 
pipe = pipe.to("cuda")

# Abstract painting representing the sound of jazz music, using vibrant colors and erratic shapes
# prompt = "Surrealist painting of a floating island with giant clock gears, populated with mythical creatures"
prompt = "Abstract painting representing the sound of jazz music, using vibrant colors and erratic shapes"
image = pipe(prompt).images[0]  # image here is in [PIL format](https://pillow.readthedocs.io/en/stable/)

# Saving the image 
image.save(f"{prompt}.png")
