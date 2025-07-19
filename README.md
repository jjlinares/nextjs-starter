# Next.js Application Template

Follow these steps to create a new Next.js application:

### 1. Create .env file

```bash
touch .env
```

### 2. Open devcontainer

Press `F1` and select "Dev Containers: Rebuild and Reopen in Container"


### 3. Install Next.js

```bash
pnpm dlx create-next-app@latest
```

Configure with these options:
- ✔ What is your project named? … **my-app**
- ✔ Would you like to use TypeScript? … **Yes**
- ✔ Would you like to use ESLint? … **No**
- ✔ Would you like to use Tailwind CSS? … **Yes**
- ✔ Would you like your code inside a `src/` directory? … **Yes**
- ✔ Would you like to use App Router? (recommended) … **Yes**
- ✔ Would you like to use Turbopack for `next dev`? … **Yes**
- ✔ Would you like to customize the import alias (`@/*` by default)? … **No**

### 4. Move Contents to Root Folder

```bash
rm my-app/README.md my-app/.gitignore && \
mv my-app/* . && \
rm -r my-app
```

### 5. Install Ultracite

```bash
pnpm dlx ultracite init
```

Configure with these options:
- ◇ Which editors do you want to configure (recommended)? **VSCode**
- ◇ Which editor rules do you want to enable (optional)? **Copilot / Cursor**
- ◇ Would you like any of the following (optional)? **Lefthook**

### 6. Install shadcn/ui

```bash
pnpm dlx shadcn@latest init
```

### 7. Install Recommended Extensions

Add these VS Code extensions:
- **Tailwind CSS IntelliSense**
- **Biome**

