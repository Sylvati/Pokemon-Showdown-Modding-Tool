import requests
from bs4 import BeautifulSoup
import os

url = "https://play.pokemonshowdown.com/sprites/gen5/"
output_folder = "gen5_front_sprites"
os.makedirs(output_folder, exist_ok=True)

# Get the directory HTML
r = requests.get(url)
soup = BeautifulSoup(r.text, "html.parser")

# Find all links ending with .png
for link in soup.find_all("a"):
    href = link.get("href")
    if href.endswith(".png"):
        print(f"Downloading {href}")
        r2 = requests.get(url + href)
        with open(os.path.join(output_folder, href), "wb") as f:
            f.write(r2.content)
