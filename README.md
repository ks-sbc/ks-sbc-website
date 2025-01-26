# Kansas Socialist Book Club Website

This repository contains the source code for the Kansas Socialist Book Club website, built with Hugo and using Obsidian content as its source.

## Project Structure

- `ks-sbc-obsidian/`: Source content in Obsidian markdown format
- `layouts/`: Hugo layout templates
- `static/`: Static assets
- `config.toml`: Hugo configuration
- `copy-files.sh`: Script to copy static files from Obsidian to Hugo

## Development Setup

1. Install Hugo (extended version)
```bash
# For Ubuntu/Debian
sudo apt install hugo
# For other systems, see: https://gohugo.io/installation/
```

2. Clone the repository
```bash
git clone https://github.com/ks-sbc/ks-sbc-website.git
cd ks-sbc-website
```

3. Run the development server
```bash
# Copy static files
./copy-files.sh

# Start Hugo server
hugo server -D
```

The site will be available at `http://localhost:1313`

## Git Workflow

We use a simple but secure branching strategy:

1. `main` branch: Production environment (protected)
   - Requires pull request review
   - Requires status checks to pass
   - No direct pushes allowed

2. `dev` branch: Development environment
   - All feature development happens here
   - Automatically deploys to dev.kssocialistbookclub.com

3. Feature branches
   - Create from `dev` branch
   - Use descriptive names (e.g., `feature/add-search`)
   - Merge back to `dev` via pull request

### Development Workflow

1. Create a feature branch from dev
```bash
git checkout dev
git pull origin dev
git checkout -b feature/your-feature-name
```

2. Make your changes and commit
```bash
git add .
git commit -m "Description of changes"
```

3. Push changes and create pull request
```bash
git push origin feature/your-feature-name
# Create PR through GitHub interface
```

4. After PR review and approval, merge to dev
5. Once changes are tested on dev environment, create PR from dev to main

## Deployment

The site is hosted on Azure Static Web Apps with automatic deployments:

- Development: https://dev.kssocialistbookclub.com
  - Automatically deploys from `dev` branch
  - Use for testing changes

- Production: https://www.kssocialistbookclub.com
  - Automatically deploys from `main` branch
  - Only accepts changes through pull requests

## Content Management

- Content is managed through Obsidian in the `ks-sbc-obsidian/` directory
- The following content is excluded from the site build:
  - `.obsidian/` configuration
  - `do-not-publish/` directory
  - `templates/` directory
  - Other exclusions defined in `config.toml`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request to the `dev` branch

## License

[Add license information here]
