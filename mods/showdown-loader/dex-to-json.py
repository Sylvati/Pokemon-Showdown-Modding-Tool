from pathlib import Path

data_file = Path(__file__).parent.resolve() / "data" / "pokedex.ts"

content = data_file.read_text()

content_by_lines = content.splitlines()

# Ignore the first line as its typescript code
# Read the first line. This gives us the internal name
print(content_by_lines[1])

# Abandon this approach, just convert the TS to a json file.