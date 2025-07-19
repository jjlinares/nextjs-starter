FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:22 AS dev

ENV NEXT_TELEMETRY_DISABLED 1

USER node

# WORKDIR /workspace
# COPY package.json pnpm-lock.yaml* ./

# RUN pnpm install

############################ PROD ############################
FROM node:22-alpine AS base

# Rebuild the source code only when needed
FROM base AS builder

WORKDIR /app

COPY package.json pnpm-lock.yaml* ./
RUN corepack enable pnpm && corepack use pnpm@latest-10 && pnpm install
COPY public ./public
COPY src ./src
COPY components.json .
COPY next.config.ts .
COPY tsconfig.json .
COPY postcss.config.mjs .

RUN pnpm run build

FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1

# Example of how to pass in environment variables at build time
# ARG API_SERVER_URL
# ENV API_SERVER_URL=$API_SERVER_URL

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs
USER nextjs

COPY --from=builder /app/public ./public

# Automatically leverage output traces to reduce image size: https://nextjs.org/docs/advanced-features/output-file-tracing
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

EXPOSE 3000

ENV PORT=3000

# server.js is created by next build from the standalone output
# https://nextjs.org/docs/pages/api-reference/config/next-config-js/output
ENV HOSTNAME="0.0.0.0"
CMD ["node", "server.js"]
